// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./IERC5192.sol";

/// @title SpaceshipUniverse1
/// @notice Spaceship NFT for Spacebar Universe 1
/// This contract introduces the concept of "Active Ownership", where the user must fulfill
/// certain conditions to gain full ownership of a spaceship NFT.
/// Until these conditions are met, the spaceship is locked and cannot be transferred.
/// For above purpose, this contract implements ERC5192.
/// Additionally, the Space Factory reserves the right to burn the spaceship under specific conditions (to be defined).
/// The total circulating supply (minted - burned) is limited, and this limit is maintained in the Space Factory contract.
interface ISpaceshipUniverse1 is IERC721, IERC5192 {
    /// @notice Mints a new Spaceship. Spaceships are locked by default (aka. Protoship)
    /// @dev Only space factory contract can call this function.
    /// @param to The address to mint the Protoship to.
    /// This should be TBA's address as the Protoship is initially bound to the TBA.
    function mint(address to) external returns (uint256 tokenId);

    /// @notice Burns a Spaceship
    /// @dev Only space factory contract can call this function, and only Protoship can be burned.
    /// @param tokenId of the Spaceship to burn.
    function burn(uint256 tokenId) external;

    /// @notice Unlocks a Spaceship (aka. Protoship becomes Ownership)
    /// @dev Only space factory contract can call this function, and from this point on,
    /// user fully owns the Spaceship and can transfer it to other users.
    /// @param tokenId of the Spaceship to unlock.
    function unlock(uint256 tokenId) external;

    /// @notice Called when metadata of a Spaceship is updated
    /// @dev This function will only emit an event (ERC4906)
    /// @param tokenId of the Spaceship to update metadata
    function updateMetadata(uint256 tokenId) external;

    /// @dev Returns the next token id to be minted
    function nextTokenId() external returns (uint256);
}
