pragma solidity ^0.5.9;
pragma experimental ABIEncoderV2;

//returning a struct is not available in old versions. Need to import experimental ABIEncoderV2 to get access to that.


contract KYC{
    
    // defining a variable admin with the type address to use in the constructor
    address admin;
    
    // defining a struct named Customer
    struct Customer {
        string userName;   
        string data;  
        bool kycStatus;
        uint upvotes;
        uint downvotes;
        address bank;
    }
    
    // defining a struct named Bank
    struct Bank {
        string name;
        address ethAddress;
        uint complaintsReported;
        uint kycCount;
        bool isAllowedToVote;
        string regNumber;
    }
    
    // defining a struct named Request
    struct Request {
        string userName;
        address bank;
        string data;
    }
    
    // create arrays of the structs
    mapping(string => Customer) customers;

    mapping(address => Bank) banks;
    
    mapping(string => Request) requests;
    
    // To initialise constructor for the first time defining admin of the smart contract
    constructor() public {
        admin = msg.sender;
    }
    
    // Admin's ability to add bank
    function addBank(string memory name, address ethAddress, string memory regNumber) public payable returns(bool) {
        bool isTheAdditionDone = false;
        if (admin == msg.sender) {
            Bank(name,ethAddress,0,0,true,regNumber);
            isTheAdditionDone = false;
            return isTheAdditionDone;
        }
        return isTheAdditionDone;
    }
    
    // Admin's ability to modify bank
    function modifyBank(string memory name, address ethAddress,uint complaintsReported,uint kycCount,bool isAllowedToVote,string memory regNumber) public payable returns(bool) {
        bool isTheModificationDone = false;
        if (admin == msg.sender) {
            Bank(name,ethAddress,complaintsReported,kycCount,isAllowedToVote,regNumber);
            isTheModificationDone = false;
            return isTheModificationDone;
        }
        return isTheModificationDone;
    }
    
    // Admin's ability to remove bank
    function removeBank(address ethAddress) public {
        if (admin == msg.sender) {
            delete banks[ethAddress];
        }
    }
    
    
    // Adding a KYC request of a customer from the bank
    function addRequest(string memory _userName, string memory _customerData) public {
        require(requests[_userName].bank == address(0), "Request is already present, please call modifyCustomer to edit the customer data");
        requests[_userName].userName = _userName;
        requests[_userName].data = _customerData;
        requests[_userName].bank = msg.sender;
    }
    
    // Adding a customer by bank
    function addCustomer(string memory _userName, string memory _customerData) public {
        require(customers[_userName].bank == address(0), "Customer is already present, please call modifyCustomer to edit the customer data");
        customers[_userName].userName = _userName;
        customers[_userName].data = _customerData;
        customers[_userName].bank = msg.sender;
    }
    
    // Remove the request added by the bank
    function removeRequest(string memory _userName) public {
        require(requests[_userName].bank != address(0), "Customer doesn't exist, please call addRequest to add the customer data");
        delete requests[_userName];
    }
    
    
    // Functions defining the customer to view, upvoting, downvoting and modifying the customer data
    function viewCustomer(string memory _userName) public view returns (string memory, string memory, address) {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        return (customers[_userName].userName, customers[_userName].data, customers[_userName].bank);
    }
    
    function upvoteCustomer(string memory _userName) public {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        customers[_userName].upvotes += 1;
    }
    
    function downvoteCustomer(string memory _userName) public {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        customers[_userName].downvotes += 1;
    }
    
    function modifyCustomer(string memory _userName, string memory _newcustomerData) public {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        customers[_userName].data = _newcustomerData;
    }    
    
    // Complaints against a bank
    function bankComplaints(address _ethAddress) public view returns (uint) {
        require(banks[_ethAddress].ethAddress != address(0), "bank doesn't exist");
        return (banks[_ethAddress].complaintsReported);
    }
    
    // Viewing the details of the bank
    function viewBankDetails(address _ethAddress) public view returns (Bank memory) {
        require(banks[_ethAddress].ethAddress != address(0), "bank doesn't exist");
        return (banks[_ethAddress]);        
    }
    
    // Reporting the bank
    function reportBank(address _ethAddress) public {
        require(banks[_ethAddress].ethAddress != address(0), "bank doesn't exist");
        banks[_ethAddress].isAllowedToVote = false;
    }
}    


