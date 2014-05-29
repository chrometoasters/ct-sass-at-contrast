ct-sass-at-contrast
===========

A high contrast mixin.

__Please note: this plugin is optimised for internal Chrometoaster use. YMMV.__

## Installation

1. In Terminal: `cd /PATH/TO/PROJECT-THEME-FOLDER`
1. `bower install https://github.com/chrometoasters/ct-sass-at-contrast.git#v1.2.1 --save`

Note: if you wish to customise where Bower puts installed components, you may add a `.bowerrc` file into this folder:

        {
            "directory" : "PATH/TO/COMPONENTS"
        }


## Dependencies

The high contrast colour scheme is namespaced using a Sass Map, so one of the following is required:

1. Compass `1.0.0.alpha.19`
1. Sass `3.3`+

## Set up

### SCSS

    @import "compass";
    @import "ct-sass-at-contrast/_at-contrast.scss";

To customise the `light`, `dark` and `highlight` colours, specify your own map before importing the mixin:

    $contrast: (
        dark: #333,
        light: #eaeaea,
        highlight: #fc0
    );
    @import "ct-sass-at-contrast/_at-contrast.scss";

### HTML

High contrast styles are applied when a parent element has the high-contrast attribute:

    [data-state_high-contrast="true"]

Usually this would be applied to the root element (`html`).

This attribute can be applied and toggled using the `ct-jquery-state` plugin.

## Usage

Apply a colour scheme to the page when `[data-state_high-contrast="true"]`:

    html { /* this could be the html element, the body element, or an internal wrapper */
        @include at-contrast_light;
    }

Apply the `light` colour scheme (black on white) to a module when `[data-state_high-contrast="true"]`:

    .module-foo {
        color: red;
        @include at-contrast_light;
    }

Apply the `dark` colour scheme (white on black) to a module when `[data-state_high-contrast="true"]`:

    .module-bar {
        color: red;
        @include at-contrast_dark;
    }

Apply the `highlight` colour scheme (yellow on black) to a module when `[data-state_high-contrast="true"]`:

    .module-baz {
        @include at-contrast_highlight;
    }

Override a contrast color scheme to a module when `[data-state_high-contrast="true"]`:

    .module-zzz {
        @include at-contrast_light;
        @include at-contrast {
            background-color: map-get($contrast, dark) !important;
            &,
            * {
                color: green !important;
            }
        }
    }

## TODO

1. Ideally contrast rules would be in a separate stylesheet. There are currently no clean solutions to this problem (`styleguide.scss` which outputs everything + `.styleguide` rules; 'is' and 'not' mixins).
1. Colour overrides require the `*` selector
1. Add tests, using [getComputedStyle](http://stackoverflow.com/questions/19137507/jquery-equivalent-for-getcomputedstyle)