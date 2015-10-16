contract BlockDefStorage
{
	bool[32] occupiesInitialized;
	bool[32] attachestoInitialized;
	bool allOccupiesInitialized;
	bool allAttachestoInitialized;
	
    Block[32] blocks;
    struct Block
    {
    	int8[3][8] occupies; // [x,y,z] 8 times
    	int8[3][] attachesto; // [x,y,z]
    }
    
    function getOccupies(uint8 which) public constant returns (int8[3][8])
    {
    	return blocks[which].occupies;
    }
    
    function getAttachesto(uint8 which) public constant returns (int8[3][])
    {
    	return blocks[which].attachesto;
    }
    
//  function getLocked() public constant returns (bool)
//  {
//  	return (allOccupiesInitialized && allAttachestoInitialized);
//  }
    
    function initOccupies(uint8 which, int8[3][8] occupies) public 
    {
    	if(allOccupiesInitialized) // lockout
    		return;
    	blocks[which].occupies = occupies;
    	occupiesInitialized[which] = true;
    	for(uint8 b = 0; b < 32; b++)
    	{
    		if(occupiesInitialized[b] == false)
    			return;
    	}	
    	allOccupiesInitialized = true;
    }
    
    function initAttachesto(uint8 which, int8[3][] attachesto) public
    {
    	if(allAttachestoInitialized) // lockout
    		return;
    	blocks[which].attachesto.length = attachesto.length;
    	blocks[which].attachesto = attachesto;
    	attachestoInitialized[which] = true;
    	for(uint8 b = 0; b < 32; b++)
    	{
    		if(attachestoInitialized[b] == false)
    			return;
    	}	
    	allAttachestoInitialized = true;
    }
}

// address: 0xed9c3aead241f6fd8e6b6951e29c3dcb5b3662c1
// creation tx: 0xcf6a6964a36391989a3b2092d921f73c30cfc59b4af3792efefe9c38efcf3639

// compiled and deployed with:

/*
 0.1.5-e11e10f8/.-Emscripten/clang/int linked to libethereum-

 bytecode:
 
 60606040526106c2806100126000396000f3606060405260e060020a60003504630878bc51811461003c5780631256c698146100f4578063197bcde7146101525780631bcf5758146101c3575b005b61029b6004356040805160208181019092526000815290600390839081101561000257505060408051600b60098502018054602081810284018101909452808352919290919060009084015b82821015610376576000848152602081206040805160608101918290529291850191600391908390855b825461010083900a900460000b8152602060019283018181049485019490930390920291018084116100b2579050505050505081526020019060010190610088565b60408051610100810190915261003a90600480359161032490602460086000835b828210156102f657604080516060818101909252908381028601906003908390839080828437820191505050505081526020019060010190610115565b604080516024803560048181013560208181028601810190965280855261003a958235959294604494019190819060009085015b8282101561031157604080516060818101909252908381028701906003908390839080828437820191505050505081526020019060010190610186565b610332600435610300604051908101604052806008905b6060604051908101604052806003905b60008152602001906001900390816101ea579050508152602001906001900390816101da57506003905082602081101561000257600902016000506040805161010081019091529060086000835b82821015610376576040805160608101918290529085840190600390826000855b825461010083900a900460000b815260206001928301818104948501949093039092029101808411610259579050505050505081526020019060010190610238565b60405180806020018281038252838181518152602001915080516000925b818410156102e557602084810284010151606080838184600060046018f15090500192600101926102b9565b925050509250505060405180910390f35b509294505050505060025460009060ff16156103945761038f565b509395505050505050600254600090610100900460ff16156105015761038f565b6040516000826008835b818410156103665760208402830151606080838184600060046018f150905001926001019261033c565b9250505091505060405180910390f35b505050509050919050565b6002805460ff191660011790555b505050565b81600384602081101561000257506009850290810191600b91909101908261010082015b8281111561041557825182906001820190826060820160005b8382111561045257835183826101000a81548160ff021916908360f860020a90810204021790555092602001926001016020816000010492830192600103026103d1565b506104949291505b80821115610490576000815560010161041d565b505061047f9291505b8082111561049057805460ff1916815560010161043a565b80156104315782816101000a81549060ff0219169055600101602081600001049283019260010302610452565b5050916020019190600101906103b8565b5090565b506001905060008460208110156100025750602080860480549187066101000a60ff81021990921690911790559150505b60208160ff1610156103815760008160208110156100025760208082045491066101000a900460ff1614156104f95761038f565b6001016104c5565b815160038460208110156100025760090201600050600801600050818154818355818115116105415760008381526020902061054191810190830161041d565b50505050816003600050846020811015610002578251600991909102600b0180548282556000828152602090819020929591830194500182156105e2579160200282015b828111156105e257825182906001820190826060820160005b838211156105fb57835183826101000a81548160ff021916908360f860020a908102040217905550926020019260010160208160000104928301926001030261059e565b5061063992915061041d565b505061062892915061043a565b80156105ee5782816101000a81549060ff02191690556001016020816000010492830192600103026105fb565b505091602001919060010190610585565b5060019050808460208110156100025760208082049092019190066101000a81548160ff02191690830217905550600090505b60208160ff1610156106a6576001816020811015610002576020808204909201549190066101000a900460ff16600014156106ba5761038f565b6002805461ff001916610100179055505050565b60010161066c56
 
 abi 
 
 [{"constant":true,"inputs":[{"name":"which","type":"uint8"}],"name":"getAttachesto","outputs":[{"name":"","type":"int8[3][]"}],"type":"function"},{"constant":false,"inputs":[{"name":"which","type":"uint8"},{"name":"occupies","type":"int8[3][8]"}],"name":"initOccupies","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"which","type":"uint8"},{"name":"attachesto","type":"int8[3][]"}],"name":"initAttachesto","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"which","type":"uint8"}],"name":"getOccupies","outputs":[{"name":"","type":"int8[3][8]"}],"type":"function"}]

web3 deploy 

var blockdefstorageContract = web3.eth.contract([{"constant":true,"inputs":[{"name":"which","type":"uint8"}],"name":"getAttachesto","outputs":[{"name":"","type":"int8[3][]"}],"type":"function"},{"constant":false,"inputs":[{"name":"which","type":"uint8"},{"name":"occupies","type":"int8[3][8]"}],"name":"initOccupies","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"which","type":"uint8"},{"name":"attachesto","type":"int8[3][]"}],"name":"initAttachesto","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"which","type":"uint8"}],"name":"getOccupies","outputs":[{"name":"","type":"int8[3][8]"}],"type":"function"}]);
var blockdefstorage = blockdefstorageContract.new(
   {
     from: web3.eth.accounts[0], 
     data: '60606040526106c2806100126000396000f3606060405260e060020a60003504630878bc51811461003c5780631256c698146100f4578063197bcde7146101525780631bcf5758146101c3575b005b61029b6004356040805160208181019092526000815290600390839081101561000257505060408051600b60098502018054602081810284018101909452808352919290919060009084015b82821015610376576000848152602081206040805160608101918290529291850191600391908390855b825461010083900a900460000b8152602060019283018181049485019490930390920291018084116100b2579050505050505081526020019060010190610088565b60408051610100810190915261003a90600480359161032490602460086000835b828210156102f657604080516060818101909252908381028601906003908390839080828437820191505050505081526020019060010190610115565b604080516024803560048181013560208181028601810190965280855261003a958235959294604494019190819060009085015b8282101561031157604080516060818101909252908381028701906003908390839080828437820191505050505081526020019060010190610186565b610332600435610300604051908101604052806008905b6060604051908101604052806003905b60008152602001906001900390816101ea579050508152602001906001900390816101da57506003905082602081101561000257600902016000506040805161010081019091529060086000835b82821015610376576040805160608101918290529085840190600390826000855b825461010083900a900460000b815260206001928301818104948501949093039092029101808411610259579050505050505081526020019060010190610238565b60405180806020018281038252838181518152602001915080516000925b818410156102e557602084810284010151606080838184600060046018f15090500192600101926102b9565b925050509250505060405180910390f35b509294505050505060025460009060ff16156103945761038f565b509395505050505050600254600090610100900460ff16156105015761038f565b6040516000826008835b818410156103665760208402830151606080838184600060046018f150905001926001019261033c565b9250505091505060405180910390f35b505050509050919050565b6002805460ff191660011790555b505050565b81600384602081101561000257506009850290810191600b91909101908261010082015b8281111561041557825182906001820190826060820160005b8382111561045257835183826101000a81548160ff021916908360f860020a90810204021790555092602001926001016020816000010492830192600103026103d1565b506104949291505b80821115610490576000815560010161041d565b505061047f9291505b8082111561049057805460ff1916815560010161043a565b80156104315782816101000a81549060ff0219169055600101602081600001049283019260010302610452565b5050916020019190600101906103b8565b5090565b506001905060008460208110156100025750602080860480549187066101000a60ff81021990921690911790559150505b60208160ff1610156103815760008160208110156100025760208082045491066101000a900460ff1614156104f95761038f565b6001016104c5565b815160038460208110156100025760090201600050600801600050818154818355818115116105415760008381526020902061054191810190830161041d565b50505050816003600050846020811015610002578251600991909102600b0180548282556000828152602090819020929591830194500182156105e2579160200282015b828111156105e257825182906001820190826060820160005b838211156105fb57835183826101000a81548160ff021916908360f860020a908102040217905550926020019260010160208160000104928301926001030261059e565b5061063992915061041d565b505061062892915061043a565b80156105ee5782816101000a81549060ff02191690556001016020816000010492830192600103026105fb565b505091602001919060010190610585565b5060019050808460208110156100025760208082049092019190066101000a81548160ff02191690830217905550600090505b60208160ff1610156106a6576001816020811015610002576020808204909201549190066101000a900460ff16600014156106ba5761038f565b6002805461ff001916610100179055505050565b60010161066c56', 
     gas: 3000000
   }, function(e, contract){
    if (typeof contract.address != 'undefined') {
         console.log(e, contract);
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })
 
 uDApp
 
 [{"name":"BlockDefStorage","interface":"[{\"constant\":true,\"inputs\":[{\"name\":\"which\",\"type\":\"uint8\"}],\"name\":\"getAttachesto\",\"outputs\":[{\"name\":\"\",\"type\":\"int8[3][]\"}],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"which\",\"type\":\"uint8\"},{\"name\":\"occupies\",\"type\":\"int8[3][8]\"}],\"name\":\"initOccupies\",\"outputs\":[],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"which\",\"type\":\"uint8\"},{\"name\":\"attachesto\",\"type\":\"int8[3][]\"}],\"name\":\"initAttachesto\",\"outputs\":[],\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"which\",\"type\":\"uint8\"}],\"name\":\"getOccupies\",\"outputs\":[{\"name\":\"\",\"type\":\"int8[3][8]\"}],\"type\":\"function\"}]\n","bytecode":"60606040526106c2806100126000396000f3606060405260e060020a60003504630878bc51811461003c5780631256c698146100f4578063197bcde7146101525780631bcf5758146101c3575b005b61029b6004356040805160208181019092526000815290600390839081101561000257505060408051600b60098502018054602081810284018101909452808352919290919060009084015b82821015610376576000848152602081206040805160608101918290529291850191600391908390855b825461010083900a900460000b8152602060019283018181049485019490930390920291018084116100b2579050505050505081526020019060010190610088565b60408051610100810190915261003a90600480359161032490602460086000835b828210156102f657604080516060818101909252908381028601906003908390839080828437820191505050505081526020019060010190610115565b604080516024803560048181013560208181028601810190965280855261003a958235959294604494019190819060009085015b8282101561031157604080516060818101909252908381028701906003908390839080828437820191505050505081526020019060010190610186565b610332600435610300604051908101604052806008905b6060604051908101604052806003905b60008152602001906001900390816101ea579050508152602001906001900390816101da57506003905082602081101561000257600902016000506040805161010081019091529060086000835b82821015610376576040805160608101918290529085840190600390826000855b825461010083900a900460000b815260206001928301818104948501949093039092029101808411610259579050505050505081526020019060010190610238565b60405180806020018281038252838181518152602001915080516000925b818410156102e557602084810284010151606080838184600060046018f15090500192600101926102b9565b925050509250505060405180910390f35b509294505050505060025460009060ff16156103945761038f565b509395505050505050600254600090610100900460ff16156105015761038f565b6040516000826008835b818410156103665760208402830151606080838184600060046018f150905001926001019261033c565b9250505091505060405180910390f35b505050509050919050565b6002805460ff191660011790555b505050565b81600384602081101561000257506009850290810191600b91909101908261010082015b8281111561041557825182906001820190826060820160005b8382111561045257835183826101000a81548160ff021916908360f860020a90810204021790555092602001926001016020816000010492830192600103026103d1565b506104949291505b80821115610490576000815560010161041d565b505061047f9291505b8082111561049057805460ff1916815560010161043a565b80156104315782816101000a81549060ff0219169055600101602081600001049283019260010302610452565b5050916020019190600101906103b8565b5090565b506001905060008460208110156100025750602080860480549187066101000a60ff81021990921690911790559150505b60208160ff1610156103815760008160208110156100025760208082045491066101000a900460ff1614156104f95761038f565b6001016104c5565b815160038460208110156100025760090201600050600801600050818154818355818115116105415760008381526020902061054191810190830161041d565b50505050816003600050846020811015610002578251600991909102600b0180548282556000828152602090819020929591830194500182156105e2579160200282015b828111156105e257825182906001820190826060820160005b838211156105fb57835183826101000a81548160ff021916908360f860020a908102040217905550926020019260010160208160000104928301926001030261059e565b5061063992915061041d565b505061062892915061043a565b80156105ee5782816101000a81549060ff02191690556001016020816000010492830192600103026105fb565b505091602001919060010190610585565b5060019050808460208110156100025760208082049092019190066101000a81548160ff02191690830217905550600090505b60208160ff1610156106a6576001816020811015610002576020808204909201549190066101000a900460ff16600014156106ba5761038f565b6002805461ff001916610100179055505050565b60010161066c56"}]
 
 
 */


