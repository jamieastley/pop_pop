# <img src="https://github.com/jamieastley/pop_pop/raw/master/docs/bubbles.png" alt="bubbles" width="30"/> pop_pop_components <img src="https://github.com/jamieastley/pop_pop/raw/master/docs/bubbles.png" alt="bubbles" width="30"/>

<p align="left">
<a href="https://pub.dev/packages/pop_pop"><img src="https://img.shields.io/pub/v/pop_pop_components.svg" alt="Pub"></a>
<a href="https://github.com/jamieastley/pop_pop/actions"><img src="https://github.com/jamieastley/pop_pop/workflows/pop_pop_components/badge.svg" alt="build"></a>
<a href="https://codecov.io/gh/jamieastley/pop_pop"><img src="https://codecov.io/gh/jamieastley/pop_pop/branch/master/graph/badge.svg" alt="codecov"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

Extends upon [pop_pop](https://pub.dev/packages/pop_pop) to provide out of the box components to implement a bubble popping game in Flutter.

## Getting Started

* Add to your `pubspec.yaml`:
```yaml
dependencies:
  
  pop_pop_components: <version>
```

## Components

- See the example app for how these are used together.

### `PopPopBloc`

Controls the logic of the game, scoring, calculating the game size and subscribing to an optional `PopPopTimer` implementation. Also takes an optional `PopPopAudio` to implement sound effects.

### `PopPopGrid`

Builds a bubble grid which can either be staggered or straight. Provides widget callbacks to allow decoupling bubble widget implementations from the game grid.

### `PopPopStreamTimer`

A stream-based countdown timer which emits a tick every second. Also contains an extension to transform seconds left into a digital clock timestamp (eg. `00:12`).

### `ProviderBubble`

A [provider](https://pub.dev/provider) based bubble wrapper that encapsulates each bubbles' state, and updates the widget to display the given popped bubble widget upon popping.

### `ReflectiveBubblePainter`/`PoppedBubblePainter`

`CustomPainter` based bubble UI widgets. Builds their colors based upon the given `PopPopBubbleTheme`.


## Feedback/Suggestions?

- [Open an issue here](https://github.com/jamieastley/pop_pop/issues)

## Maintainers

- [@jamieastley](https://github.com/jamieastley)