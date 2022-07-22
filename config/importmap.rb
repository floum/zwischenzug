# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "chessground", to: "https://ga.jspm.io/npm:chessground@8.2.1/chessground.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"

pin "chessgame", to: "chessgame.js", preload: true
pin "chessboard", to: "chessboard.js", preload: true
pin "chess.js", to: "https://ga.jspm.io/npm:chess.js@0.13.3/chess.js"
