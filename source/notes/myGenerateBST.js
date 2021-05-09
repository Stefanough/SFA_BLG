class BSTNode {
  constructor(val, parent = null, left = null, right = null) {
    this.val = val;
    this.parent = parent;
    this.left = left;
    this.right = right;
  }
}

class BST {
  constructor(arr) {
    this.root = new BSTNode(arr[0])
    let currentNode = this.root
    for (let i = 1; i < arr.length; i++) {

      if (arr[i] < currentNode) {
        if (currentNode.left == null) {
          currentNode.left = new BSTNode(arr[i], currentNode)
        } else {
          currentNode = currentNode.left
          currentNode.left = new BSTNode(arr[i], currentNode)
        }
      }

      if (arr[i] >= currentNode) {
        currentNode.right = new BSTNode(arr[i])
      }
    }
  }

  print(node = this.root, output = {}) {
    if (node == null) return node
    output[val] = {}
    
  }
}

