package  main 
import (
	"encoding/json"
	"fmt"
	"github.com/hyperledger/fabric/core/chaincode/shim"
	pb "github.com/hyperledger/fabric/protos/peer"
)
//声明名为Mychaincode结构体
type Mychaincode struct {

}
//声明数字资产结构体
type digitalassets struct{
	ObjectType  string  `json:"docType"`
	Md5			string  `json:"md5"` 
	Owner 		string  `json:"owner"`
	Key_values  string  `json:"key_values"`

}
//主函数，需要调用shim.Start()方法
func  main() {
	err := shim.Start(new(Mychaincode))
	if err != nil {
		fmt.Printf("Error starting Mychaincode: %s",err)
	}
}
//为Mychaincode添加Init方法
func (t *Mychaincode) Init(stub shim.ChaincodeStubInterface) pb.Response{
	return shim.Success(nil)
}

//为Mychaincode添加Invoke方法
func (t *Mychaincode) Invoke(stub shim.ChaincodeStubInterface) pb.Response {
	function,args := stub.GetFunctionAndParameters()
	fmt.Println("invoke is runing "+function)


	if function == "setdigital" {
		return t.setdigital(stub,args)	//创建一个数字资产信息，并写入账本
	}else if function == "readdisital" {
		return t.readdisital(stub,args)
	}else if function == "deletedigital" {
		return t.deletedigital(stub,args)
	}



	fmt.Println("invoke did not find func: " + function) //错误，未发现所调用的函数
	return shim.Error("Received unknown function invocation")


}

func  (t *Mychaincode) setdigital(stub shim.ChaincodeStubInterface, args []string) pb.Response {

	if len(args) != 3 {
		return shim.Error("Incorrect number of arguments. Expecting 3")
	}

	fmt.Println("- start init marble")
	if len(args[0]) <= 0 {
		return shim.Error("1st argument must be a non-empty string")
	}
	if len(args[1]) <= 0 {
		return shim.Error("2nd argument must be a non-empty string")
	}
	if len(args[2]) <= 0 {
		return shim.Error("3rd argument must be a non-empty string")
	}

	digitalMd5 := args[0]
	digitalOwner :=  args[1]
	digitalKeyvalue := args[2]
	digitalAsBytes , err := stub.GetState(digitalMd5)
	if err != nil {
		return shim.Error("获取digital失败"+err.Error())
	}else if digitalAsBytes != nil {
		fmt.Printf("%s digital 已经存在！！！",digitalMd5)
		return 	shim.Error("digital	已经存在！")
	}

	objectType	:=	"digitalassets"
	digitalassets := &digitalassets{objectType,digitalMd5,digitalOwner,digitalKeyvalue}
	digitalJsonAsBytes,err	:=	json.Marshal(digitalassets)
	if	err	!=	nil	{
		return	shim.Error(err.Error())
	}


	err	 =	stub.PutState(digitalMd5,digitalJsonAsBytes)
	if	err	!=	nil	{
		return	shim.Error(err.Error())
	}
	return	shim.Success(nil)

}


func (t *Mychaincode) readdisital (stub	shim.ChaincodeStubInterface , args []string) pb.Response{
	fmt.Println("readdisital	start")
	var md5 , jsonResp string

	md5 = args[0]
	digitalAsByte , err := stub.GetState(md5)
	if err != nil{
		jsonResp = "{\"error\":	\"获取数据失败！\"}"
		return	shim.Error(jsonResp)
	} else if digitalAsByte == nil {
		jsonResp	=	"{\"error\":	\"digital	不存在！\"}"
		return	shim.Error(jsonResp)
	}

	return	shim.Success(digitalAsByte)
}

func (t *Mychaincode) deletedigital (stub shim.ChaincodeStubInterface , args []string) pb.Response {
	var digitalname string 
	digitalname = args[0]
	digitalAsByte , err := stub.GetState(digitalname)
	if err != nil {
		return shim.Error("获取digital失败" + err.Error())
	} else if digitalAsByte == nil {
		return shim.Error("digital 不存在！")
	}
	err	=	stub.DelState(digitalname)
	if	err	!=	nil	{
		return	shim.Error(err.Error())
	}
	return	shim.Success(nil)

}
