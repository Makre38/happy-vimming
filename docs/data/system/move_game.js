(function (root) {
  var TOTAL_ROUNDS = 12;
  var DURATIONS = [1200, 1200, 1200, 1200, 900, 900, 900, 900, 700, 700, 700, 700];
  var ARROWS = [
    { symbol: "↑", key: "k", display: "k" },
    { symbol: "↓", key: "j", display: "j" },
    { symbol: "←", key: "h", display: "h" },
    { symbol: "→", key: "l", display: "l" }
  ];
  var state = {
    host: null,
    nodes: null,
    keyHandler: null,
    timerId: null,
    roundIndex: 0,
    hits: 0,
    activeArrow: null,
    acceptingInput: false
  };

  function getF() {
    if (root.TYRANO && TYRANO.kag && TYRANO.kag.stat) {
      return TYRANO.kag.stat.f;
    }

    return null;
  }

  function cleanup() {
    if (state.keyHandler) {
      root.document.removeEventListener("keydown", state.keyHandler, true);
      state.keyHandler = null;
    }

    if (state.timerId) {
      root.clearTimeout(state.timerId);
      state.timerId = null;
    }

    if (state.host) {
      state.host.innerHTML = "";
    }

    state.nodes = null;
    state.roundIndex = 0;
    state.hits = 0;
    state.activeArrow = null;
    state.acceptingInput = false;
  }

  function markForbiddenInput() {
    var f = getF();
    if (f) {
      f.only_hjkl_return = false;
    }
  }

  function updateCounter() {
    state.nodes.counter.textContent = state.hits + " / " + TOTAL_ROUNDS;
  }

  function renderInput(value, resultClass) {
    state.nodes.inputBox.textContent = value;
    state.nodes.inputBox.classList.remove("is-hit", "is-miss");
    if (resultClass) {
      state.nodes.inputBox.classList.add(resultClass);
    }
  }

  function chooseArrow() {
    return ARROWS[Math.floor(Math.random() * ARROWS.length)];
  }

  function scoreToDelta() {
    if (state.hits >= 9) {
      return 2;
    }
    if (state.hits >= 5) {
      return 1;
    }
    return -1;
  }

  function finishGame() {
    var f = getF();
    if (f) {
      f.move_hits = state.hits;
      f.score += scoreToDelta();
    }

    cleanup();

    if (root.TYRANO && TYRANO.kag) {
      TYRANO.kag.ftag.startTag("cm", {});
      TYRANO.kag.layer.showEventLayer();
      TYRANO.kag.ftag.startTag("jump", { target: "*move_result" });
    }
  }

  function nextRound() {
    state.roundIndex += 1;
    if (state.roundIndex >= TOTAL_ROUNDS) {
      finishGame();
      return;
    }
    startRound();
  }

  function resolveRound(displayValue, success) {
    if (!state.acceptingInput) {
      return;
    }

    state.acceptingInput = false;
    if (state.timerId) {
      root.clearTimeout(state.timerId);
      state.timerId = null;
    }

    if (success) {
      state.hits += 1;
      renderInput(displayValue, "is-hit");
    } else {
      renderInput(displayValue || "Miss", "is-miss");
    }
    updateCounter();

    root.setTimeout(function () {
      nextRound();
    }, 180);
  }

  function startRound() {
    state.activeArrow = chooseArrow();
    state.nodes.arrow.textContent = state.activeArrow.symbol;
    renderInput("_", "");
    updateCounter();
    state.acceptingInput = true;

    state.timerId = root.setTimeout(function () {
      resolveRound("Miss", false);
    }, DURATIONS[state.roundIndex]);
  }

  function onKeyDown(event) {
    if (!state.acceptingInput) {
      return;
    }

    var key = event.key;
    var lower = key.toLowerCase();

    if (lower === "h" || lower === "j" || lower === "k" || lower === "l") {
      resolveRound(lower, lower === state.activeArrow.key);
      event.preventDefault();
      event.stopPropagation();
      return;
    }

    if (
      key === "ArrowUp" ||
      key === "ArrowDown" ||
      key === "ArrowLeft" ||
      key === "ArrowRight"
    ) {
      markForbiddenInput();
      resolveRound("Miss", false);
      event.preventDefault();
      event.stopPropagation();
      return;
    }

    if (key === "Enter") {
      return;
    }

    markForbiddenInput();
    resolveRound("Miss", false);
    event.preventDefault();
    event.stopPropagation();
  }

  function buildLayout(host) {
    host.innerHTML =
      '<div class="move-game">' +
      '<div class="move-game__counter"></div>' +
      '<div class="move-game__arrow"></div>' +
      '<div class="move-game__input-box">_</div>' +
      '<div class="move-game__hint">h / j / k / l</div>' +
      '</div>';

    return {
      counter: host.querySelector(".move-game__counter"),
      arrow: host.querySelector(".move-game__arrow"),
      inputBox: host.querySelector(".move-game__input-box")
    };
  }

  function mount() {
    cleanup();

    var host = root.document.querySelector('[data-move-game-root="true"]');
    if (!host) {
      return false;
    }

    state.host = host;
    state.nodes = buildLayout(host);
    state.keyHandler = onKeyDown;
    root.document.addEventListener("keydown", state.keyHandler, true);
    startRound();
    return true;
  }

  root.HappyVimmingMoveGame = {
    mount: mount,
    cleanup: cleanup
  };
})(window);
