// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    
}

interface IPool {
    function get_virtual_price() external view returns (uint256);
}

contract ContractTest is Test {
    function setUp() public {}

    function testExample() public {
        address pool = 0x4a848F44146Ca6D1D6AA34bcdF3C41093deF1761;
        address ust = 0xa693B19d2931d498c5B318dF961919BB4aee87a5;
        //address dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        address usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        address usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
        //address mim = 0x99D8a9C45b2ecA8864373A26D1459e3Dff1e17F3;
        //address sudc = 0x57Ab1ec28D129707052df4dF418D58a2D46d5f51;
        //address Threecrv = 0x6c3F90f043a72FA612cbac8115EE7e52BDe6E490;
        address frax = 0x853d955aCEf822Db058eb8505911ED77F175b99e;
        address cvxFrax = 0xFEEf77d3f69374f66429C91d732A244f074bdf74;
        address cvxThreecrv = 0x30D9410ED1D5DA1F6C8391af5338C93ab8d4035C;
        address newousdcSushi = 0xc08ED9a9ABEAbcC53875787573DC32Eee5E43513;
        address UNi_fraxusdc = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88;
        address newo = 0x98585dFc8d9e7D48F0b1aE47ce33332CF4237D96;

        emit log_named_uint("TIME", block.timestamp);
        //emit log_named_uint("VPrice", IPool(pool).get_virtual_price());

        emit log_named_uint("USDT", IERC20(usdt).balanceOf(pool));
        emit log_named_uint("UST", IERC20(ust).balanceOf(pool));
        // emit log_named_uint("DAI", IERC20(dai).balanceOf(pool));
        emit log_named_uint("USDC", IERC20(usdc).balanceOf(pool));
        // emit log_named_uint("MIM", IERC20(mim).balanceOf(pool));
        // emit log_named_uint("sUSD", IERC20(sudc).balanceOf(pool));
        emit log_named_uint("FRAX", IERC20(frax).balanceOf(pool));
        //emit log_named_uint("3crv", IERC20(Threecrv).balanceOf(pool));
        emit log_named_uint("CVXFRAX", IERC20(cvxFrax).balanceOf(pool));
        emit log_named_uint("CVX3crv", IERC20(cvxThreecrv).balanceOf(pool));
        emit log_named_uint("Sushi_NEWO/USDC", IERC20(newousdcSushi).balanceOf(pool));
        emit log_named_uint("UNI_FRAX/USDC", IERC20(UNi_fraxusdc).balanceOf(pool));
        emit log_named_uint("NEWO", IERC20(newo).balanceOf(pool));
    }
}
