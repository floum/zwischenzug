import { Chessground } from 'chessground';

export class Chessboard {
  constructor(element, fen, orientation) {
    this.element = element;
    this.fen = fen;
    this.orientation = orientation;
    this.board = Chessground(this.element, {fen: this.fen, orientation: this.orientation});
  }
}
