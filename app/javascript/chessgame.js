import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessgame {
  constructor(element, pgn) {
    this.element = element;
    this.game = new Chess();
    this.game.load_pgn(pgn);
    this.board = undefined;
    this.boardConfig = {
      fen: this.game.fen()
    };
  }

  render() {
    this.board = Chessground(this.element, this.boardConfig);
  }

  setFen(fen) {
    this.board.set({ fen: fen });
  }

  setOrientation(color) {
    this.board.set({ orientation: color });
  }
}
