(function (root) {
  var state = {
    host: null,
    buttons: [],
    activeIndex: 0,
    keyHandler: null
  };

  function cleanup() {
    if (state.keyHandler) {
      root.document.removeEventListener("keydown", state.keyHandler, true);
      state.keyHandler = null;
    }

    if (state.host) {
      state.host.innerHTML = "";
    }

    state.buttons = [];
    state.activeIndex = 0;
  }

  function markArrowUsage() {
    if (root.TYRANO && TYRANO.kag && TYRANO.kag.variable && TYRANO.kag.variable.f) {
      TYRANO.kag.variable.f.used_arrow = true;
    }
  }

  function renderActive() {
    state.buttons.forEach(function (button, index) {
      if (index === state.activeIndex) {
        button.classList.add("is-active");
      } else {
        button.classList.remove("is-active");
      }
    });
  }

  function move(delta) {
    if (!state.buttons.length) {
      return;
    }

    var count = state.buttons.length;
    state.activeIndex = (state.activeIndex + delta + count) % count;
    renderActive();
  }

  function choose(choice) {
    if (!root.TYRANO || !TYRANO.kag) {
      return;
    }

    cleanup();
    TYRANO.kag.ftag.startTag("cm", {});
    TYRANO.kag.layer.showEventLayer();

    if (choice.exp) {
      TYRANO.kag.embScript(choice.exp);
    }

    TYRANO.kag.ftag.startTag("jump", {
      target: choice.target
    });
  }

  function mount(config) {
    cleanup();

    var host = root.document.querySelector('[data-choice-root="true"]');
    if (!host) {
      return false;
    }

    state.host = host;
    state.buttons = config.choices.map(function (choice, index) {
      var button = root.document.createElement("div");
      button.className = "choice-ui__button";
      button.textContent = choice.label;
      button.addEventListener("mouseenter", function () {
        state.activeIndex = index;
        renderActive();
      });
      button.addEventListener("click", function () {
        choose(choice);
      });
      host.appendChild(button);
      return button;
    });

    renderActive();

    state.keyHandler = function (event) {
      var key = event.key;

      if (key === "ArrowUp" || key === "ArrowLeft") {
        markArrowUsage();
        move(-1);
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (key === "ArrowDown" || key === "ArrowRight") {
        markArrowUsage();
        move(1);
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (key === "k" || key === "K" || key === "h" || key === "H") {
        move(-1);
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (key === "j" || key === "J" || key === "l" || key === "L") {
        move(1);
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (key === "Enter") {
        var choice = config.choices[state.activeIndex];
        if (choice) {
          choose(choice);
          event.preventDefault();
          event.stopPropagation();
        }
      }
    };

    root.document.addEventListener("keydown", state.keyHandler, true);
    return true;
  }

  root.HappyVimmingChoiceUI = {
    mount: mount,
    cleanup: cleanup
  };
})(window);
