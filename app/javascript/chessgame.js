import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessgame {
  constructor(element, pgn) {
    this.element = element;
    this._game = new Chess();
    this._game.load_pgn(pgn);
    this.moves = this._game.history({verbose: true});
    this.fens = [];
    this._game = new Chess();
    this.fens.push(this._game.fen());
    for (var i in this.moves) {
      this._game.move(this.moves[i]);
      this.fens.push(this._game.fen());
    };
    this.board = Chessground(this.element, {});
    this._plyNumber = 0;
  }

  setFen(fen) {
    this.board.set({ fen: fen });
  }

  setOrientation(color) {
    this.board.set({ orientation: color });
  }

  startMove() {
    this.plyNumber = 0;
  }

  forwardMove() {
    this.plyNumber = this.plyNumber + 1;
  }

  backMove() {
    this.plyNumber -= 1;
  }

  endMove() {
    this.plyNumber = this.fens.length - 1;
  }

  get plyNumber() {
    return this._plyNumber;
  }

  set plyNumber(number) {
    this._plyNumber = number;
    this._plyNumber = Math.max(0, this._plyNumber);
    this._plyNumber = Math.min(this._plyNumber, this.fens.length - 1);
    this.board.set({ fen: this.fens[this._plyNumber]});
  };
}
