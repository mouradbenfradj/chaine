pragma solidity >=0.5.16;

contract Election {
    // Model a Candidate
    string public Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    
0Switch0
il y a 2 ans (modifié)
​ @Pradeep Garje  I figured out that I cloned from git the "finale version code" of the tutorial, but I had the "final code" not in all files. This was reason, that I stucked at the loading screen during the tutorial. First I checked the render function at app.js. There is loader.show(); and content.hide();. I added a content.show(); just for testing and I saw everything :).

Add ethereum.enable(); to initWeb3 function():
initWeb3: function() {
    // TODO: refactor conditional
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
      ethereum.enable();
      web3 = new Web3(web3.currentProvider);
    } else {
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      ethereum.enable();
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },

At Election.sol at function vote() you have to add the prefix emit:
function vote (uint _candidateId) public {
  // require that they haven't voted before
  require(!voters[msg.sender]);


  // require a valid candidate
  require(_candidateId > 0 && _candidateId <= candidatesCount);


  // record that voter has voted
  voters[msg.sender] = true;


  // update candidate vote count
  candidates[_candidateId].voteCount ++;


  // trigger voted event
  emit votedEvent(_candidateId);
 }

}
