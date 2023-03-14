// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {

        address owner;
        string title;
        string description;
        string image;
        uint256 target;
        uint256 deadlin;
        uint256 ammountCollected;
        address[] donators;
        uint256[] donations; 
    }

    mapping (uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;
    
    function createCampaign (){
    }

    function donateToCampaign (){
    }
    
}