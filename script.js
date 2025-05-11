 const ROWS = 6, COLS = 7;
    let board;
    const boardDiv = document.getElementById("board");
    const message = document.getElementById("message");
    const difficultySelect = document.getElementById("difficulty");

    function newGame() {
      board = Array.from({ length: ROWS }, () => Array(COLS).fill(0));
      message.textContent = "";
      message.classList.remove("winner");
      renderBoard();
    }

    function renderBoard() {
      boardDiv.innerHTML = "";
      for (let r = 0; r < ROWS; r++) {
        for (let c = 0; c < COLS; c++) {
          const cell = document.createElement("div");
          cell.classList.add("cell");
          if (board[r][c] === 1) cell.classList.add("player1");
          if (board[r][c] === 2) cell.classList.add("player2");
          cell.onclick = () => handleMove(c);
          boardDiv.appendChild(cell);
        }
      }
    }

    function getNextRow(col) {
      for (let r = ROWS - 1; r >= 0; r--) {
        if (board[r][col] === 0) return r;
      }
      return -1;
    }

    function handleMove(col) {
      if (message.textContent) return;
      const row = getNextRow(col);
      if (row === -1) return;
      board[row][col] = 1;
      renderBoard();
      if (checkWin(1)) return endGame("You win!");
      setTimeout(() => {
        const aiCol = getAIMove(difficultySelect.value);
        const aiRow = getNextRow(aiCol);
        if (aiRow !== -1) {
          board[aiRow][aiCol] = 2;
          renderBoard();
          if (checkWin(2)) return endGame("Computer wins!");
        }
      }, 300);
    }

    function getAIMove(level) {
      const validCols = [...Array(COLS).keys()].filter(c => getNextRow(c) !== -1);
      if (level === "random") return validCols[Math.floor(Math.random() * validCols.length)];

      for (let col of validCols) {
        const row = getNextRow(col);
        board[row][col] = 2;
        if (checkWin(2)) {
          board[row][col] = 0;
          return col;
        }
        board[row][col] = 0;
      }
      for (let col of validCols) {
        const row = getNextRow(col);
        board[row][col] = 1;
        if (checkWin(1)) {
          board[row][col] = 0;
          return col;
        }
        board[row][col] = 0;
      }

      if (level === "medium") return validCols[Math.floor(Math.random() * validCols.length)];

      return minimax(board, 4, true)[1];
    }

    function minimax(boardState, depth, isMaximizing) {
      const validCols = [...Array(COLS).keys()].filter(c => getNextRow(c) !== -1);
      let bestScore = isMaximizing ? -Infinity : Infinity;
      let bestCol = validCols[0];

      for (let col of validCols) {
        const row = getNextRow(col);
        if (row === -1) continue;
        boardState[row][col] = isMaximizing ? 2 : 1;

        if (checkWinSim(boardState, isMaximizing ? 2 : 1)) {
          boardState[row][col] = 0;
          return [isMaximizing ? 100000 : -100000, col];
        }

        let score = (depth === 0) ? scorePosition(boardState, 2) : minimax(boardState, depth - 1, !isMaximizing)[0];
        boardState[row][col] = 0;

        if (isMaximizing && score > bestScore) {
          bestScore = score;
          bestCol = col;
        } else if (!isMaximizing && score < bestScore) {
          bestScore = score;
          bestCol = col;
        }
      }
      return [bestScore, bestCol];
    }

    function scorePosition(board, player) {
      const opponent = player === 1 ? 2 : 1;
      let score = 0;

      for (let r = 0; r < ROWS; r++) {
        if (board[r][Math.floor(COLS / 2)] === player) score += 3;
      }

      function evaluateWindow(window) {
        const playerCount = window.filter(v => v === player).length;
        const emptyCount = window.filter(v => v === 0).length;
        const opponentCount = window.filter(v => v === opponent).length;

        if (playerCount === 4) return 100;
        if (playerCount === 3 && emptyCount === 1) return 10;
        if (playerCount === 2 && emptyCount === 2) return 5;
        if (opponentCount === 3 && emptyCount === 1) return -8;
        return 0;
      }

      for (let r = 0; r < ROWS; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          const window = [board[r][c], board[r][c+1], board[r][c+2], board[r][c+3]];
          score += evaluateWindow(window);
        }
      }

      for (let c = 0; c < COLS; c++) {
        for (let r = 0; r < ROWS - 3; r++) {
          const window = [board[r][c], board[r+1][c], board[r+2][c], board[r+3][c]];
          score += evaluateWindow(window);
        }
      }

      for (let r = 0; r < ROWS - 3; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          const window = [board[r][c], board[r+1][c+1], board[r+2][c+2], board[r+3][c+3]];
          score += evaluateWindow(window);
        }
      }

      for (let r = 3; r < ROWS; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          const window = [board[r][c], board[r-1][c+1], board[r-2][c+2], board[r-3][c+3]];
          score += evaluateWindow(window);
        }
      }

      return score;
    }

    function checkWin(player) {
      return checkWinSim(board, player);
    }

    function checkWinSim(b, player) {
      for (let r = 0; r < ROWS; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          if (b[r][c] === player && b[r][c+1] === player && b[r][c+2] === player && b[r][c+3] === player) return true;
        }
      }
      for (let r = 0; r < ROWS - 3; r++) {
        for (let c = 0; c < COLS; c++) {
          if (b[r][c] === player && b[r+1][c] === player && b[r+2][c] === player && b[r+3][c] === player) return true;
        }
      }
      for (let r = 0; r < ROWS - 3; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          if (b[r][c] === player && b[r+1][c+1] === player && b[r+2][c+2] === player && b[r+3][c+3] === player) return true;
        }
      }
      for (let r = 3; r < ROWS; r++) {
        for (let c = 0; c < COLS - 3; c++) {
          if (b[r][c] === player && b[r-1][c+1] === player && b[r-2][c+2] === player && b[r-3][c+3] === player) return true;
        }
      }
      return false;
    }

    function endGame(msg) {
        message.textContent = msg;
        message.classList.add("winner");
      
        // Launch confetti
        confetti({
          particleCount: 150,
          spread: 70,
          origin: { y: 0.6 }
        });
      }
      

    newGame();

   
      