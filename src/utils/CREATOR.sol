// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
interface SimpleStore {
    function getValue() external view returns (uint256);
    function setValue(uint256) external;
}

// ******* This is for use by the CTF creator only!     *******
// ******* Players do not need to change anything here. *******
library CREATOR {

    uint8 constant internal _ctfId = 0xee; // IMPORTANT: CREATOR TO UPDATE THIS!
    function ctfId() public pure returns (uint8) {
        require(_ctfId != 0xff, "IMPORTANT: CREATOR to update ctfId!");
        return _ctfId;
    }

    // IMPORTANT: CREATOR TO UPDATE THIS!
    // This function returns true or false if the solution is correct.
    // Write logic that will check if the provided solution is correct
    function verify(address solution) public returns (bool) {
        SimpleStore(solution).setValue(0x696969);
        return SimpleStore(solution).getValue() == 0x696969;
    }

    // IMPORTANT: CREATOR TO UPDATE THIS!
    // his function should return the number that should reported for gas for the solution.
    // It could be the measurement of a single function call or multiple.
    function gasReport(address solution)  public returns (uint256 gasUsed) {
        uint start = gasleft();
        SimpleStore(solution).setValue(0x420420);
        SimpleStore(solution).getValue();
        gasUsed = start - gasleft();
    }

}