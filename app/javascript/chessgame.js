import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessgame {
  constructor(element, pgn) {
    this.element = element;
    this.game = new Chess();
    this.game.load_pgn(pgn);
    this.boardConfig = {
      fen: this.game.fen()
    };
  }

  render() {
    Chessground(this.element, this.boardConfig);
  }
}
