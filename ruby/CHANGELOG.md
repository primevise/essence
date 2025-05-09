# Changelog

This is the changelog for the `essence` gem. For now, most of the updates will be reflected here.

### Unreleased

- _GRAND REFACTOR_: Keeping only the CLI functionality and serving components from a registry.
- refactor: Updating the base `Essence` component
- refactor: Simplifying the `Avatar` component

### 0.4.0

- feature: Adding `Alert` component
- feature: Adding `Checkbox` component
- feature: Adding `Input` component
- feature: Adding `Heading` component
- feature: Adding `Label` component
- feature: Adding `Metric` component
- feature: Adding `Separator` component
- feature: Adding `Switch` component
- feature: Adding `Text` component
- fix: Removing `Phlex::Kit` from the base component
- fix: Removing unecessary autoloading

### 0.3.1

- fix: Including Stimulus files in the gemspec

### 0.3.0

- feature: Adding `Tabs` component
- feature: Adding `Stimulus` controller generator via CLI
- feature: Adding configuration options: `phlex_components_path`, `stimulus_controller_path`
- chore: Initializing some basic RDoc documentation

### 0.2.3

- feature: Adding `Accordion` component
- feature: Merging classes inside the base component
- fix: Fixing the ghost variant of the `Button` component.

### 0.2.2

- fix: Fixing `Avatar` component. It was mixed up with badge for some reason. Oops!
- fix: Fixing `Badge` component. It was mixed up with badge for some reason. Oops!
- fix: Fixing `Button` component. It was mixed up with badge for some reason. Oops!

### 0.2.1

- feature: Adding `Avatar` component
- feature: Adding `Badge` component
- feature: Adding `w-fit` to `Button` component
- fix: Adding `w-fit` to `Link`
- fix: Typo in Row component item definition
- fix: Unifying base class string

### 0.2.0

- feature: Adding a _CLI_ to streamline the process of managing components
- feature: Adding a _CLI_ `install` to install Essence into the project
- feature: Adding a _CLI_ `add` to add component to the project
- chore: Tweaking the components here and there
