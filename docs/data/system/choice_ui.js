(function (root) {
  var state = {
    host: null,
    buttons: [],
    activeIndex: 0,
    keyHandler: null,
    resizeHandler: null
  };

  function cleanup() {
    if (state.keyHandler) {
      root.document.removeEventListener("keydown", state.keyHandler, true);
      state.keyHandler = null;
    }

    if (state.resizeHandler) {
      root.removeEventListener("resize", state.resizeHandler);
      state.resizeHandler = null;
    }

    if (state.host) {
      state.host.innerHTML = "";
    }

    state.buttons = [];
    state.activeIndex = 0;
  }

  function markForbiddenInput() {
    if (root.TYRANO && TYRANO.kag && TYRANO.kag.stat && TYRANO.kag.stat.f) {
      TYRANO.kag.stat.f.only_hjkl_return = false;
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

  function layoutHost() {
    if (!state.host) {
      return;
    }

    var width = Math.min(420, Math.max(280, root.innerWidth - 80));
    state.host.style.width = width + "px";

    var gap = 16;
    var buttonHeight = 64;
    var totalHeight = state.buttons.length * buttonHeight + Math.max(0, state.buttons.length - 1) * gap;
    var left = Math.max(40, Math.round((1280 - width) / 2));
    var top = Math.round(720 - totalHeight - 70);

    if (top < 300) {
      top = 300;
    }

    state.host.style.left = left + "px";
    state.host.style.top = top + "px";
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
        markForbiddenInput();
        choose(choice);
      });
      host.appendChild(button);
      return button;
    });

    layoutHost();
    renderActive();

    state.keyHandler = function (event) {
      var key = event.key;

      if (key === "ArrowUp" || key === "ArrowLeft") {
        markForbiddenInput();
        move(-1);
        event.preventDefault();
        event.stopPropagation();
        return;
      }

      if (key === "ArrowDown" || key === "ArrowRight") {
        markForbiddenInput();
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
          return;
        }
      }

      if (
        key !== "h" &&
        key !== "H" &&
        key !== "j" &&
        key !== "J" &&
        key !== "k" &&
        key !== "K" &&
        key !== "l" &&
        key !== "L"
      ) {
        markForbiddenInput();
      }
    };

    root.document.addEventListener("keydown", state.keyHandler, true);
    state.resizeHandler = layoutHost;
    root.addEventListener("resize", state.resizeHandler);
    return true;
  }

  root.HappyVimmingChoiceUI = {
    mount: mount,
    cleanup: cleanup,
    mountInsertChoices: function () {
      return mount({
        choices: [
          { label: "A", target: "*insert_A" },
          { label: "l で行末まで移動して a", target: "*insert_la" },
          { label: "i で入力を始める", target: "*insert_i" },
          { label: "行末をクリックして a", target: "*insert_click" }
        ]
      });
    }
  };
})(window);
