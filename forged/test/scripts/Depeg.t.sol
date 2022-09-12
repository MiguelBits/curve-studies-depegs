// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    
}

interface IPool {
    function get_virtual_price() external view returns (uint256);
}

contract DepegTest is Test {
    function setUp() public {}

    function testExample() public {
        address pool = 0x5a6A4D54456819380173272A5E8E9B9904BdF41B;
        //address ust = 0xa693B19d2931d498c5B318dF961919BB4aee87a5;
        //address dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        //address usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        //address usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
        address mim = 0x99D8a9C45b2ecA8864373A26D1459e3Dff1e17F3;
        //address sudc = 0x57Ab1ec28D129707052df4dF418D58a2D46d5f51;
        //address steth = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
        //address frax = 0x853d955aCEf822Db058eb8505911ED77F175b99e;
        address Threecrv = 0x6c3F90f043a72FA612cbac8115EE7e52BDe6E490;


        emit log_named_uint("TIME", block.timestamp);
        emit log_named_uint("VPrice", IPool(pool).get_virtual_price());

        //emit log_named_uint("USDT", IERC20(usdt).balanceOf(pool));
        //emit log_named_uint("UST", IERC20(ust).balanceOf(pool));
        //emit log_named_uint("DAI", IERC20(dai).balanceOf(pool));
        //emit log_named_uint("USDC", IERC20(usdc).balanceOf(pool));
        emit log_named_uint("MIM", IERC20(mim).balanceOf(pool));
        emit log_named_uint("3crv", IERC20(Threecrv).balanceOf(pool));
        //emit log_named_uint("sUSD", IERC20(sudc).balanceOf(pool));
        //emit log_named_uint("stETH", IERC20(steth).balanceOf(pool));
        //emit log_named_uint("ETH", pool.balance);
        //emit log_named_uint("FRAX", IERC20(frax).balanceOf(pool));

    }
}
