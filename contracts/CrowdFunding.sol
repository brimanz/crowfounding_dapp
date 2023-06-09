// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {

        address owner;
        string title;
        string description;
        string image;
        uint256 target;
        uint256 deadline;
        uint256 ammountCollected;
        address[] donators;
        uint256[] donations; 
    }

    mapping (uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;
    
    function createCampaign(address _owner, string memory _title, string memory _description, unin256 _target, unin256 _deadline, string memory _image) public returns(uint256) {

        Campaign storage campaign = campaigns[numberOfCampaigns];


        require(campaign.deadline < block.timestamp, "The deadline should be date in the future.");
        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign. deadline = _deadline;
        campaign.ammountCollected = 0;
        campaign.image = _image;

        numberOfCampaigns++;

        return numberOfCampaigns - 1;
    }

    function donateToCampaign(uint256 _id) publi payable{
        uint256 ammount = msg.value;

        Campaign storage campaign = campaigns[_id];
        campaign.donators.push(msg.sender);
        campaign.donations.push(ammount);

        (bool sent, ) = payable(campaign.owner).call{value: ammount}("");

        if(sent){
            campaign.ammountCollected = campaign.ammountCollected + ammount;
        }
    }
    
    function getDonators(){
    }

    function getCampaign(){
    }
}