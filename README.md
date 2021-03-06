ct-sass-at-contrast
===========

A high contrast mixin.

__Please note: this plugin is optimised for internal Chrometoaster use. YMMV.__

## Installation

1. In Terminal: `cd /PATH/TO/PROJECT-THEME-FOLDER`
1. `bower install https://github.com/chrometoasters/ct-sass-at-contrast.git#v1.3.1 --save`

Note: if you wish to customise where Bower puts installed components, you may add a `.bowerrc` file into this folder:

        {
            "directory" : "PATH/TO/COMPONENTS"
        }


## Dependencies

The high contrast colour scheme uses Sass Maps for namespacing, and `@at-root`, so one of the following is required:

1. Sass `3.3` or higher
1. Compass `1.0.0.alpha.19` or higher

## Set up

### SCSS

    @import "compass";
    @import "ct-sass-at-contrast/at-contrast";

To customise the plugin options, specify your own map before importing the mixin:

    @import "compass";
    $at-contrast: (
        dark: #000, // black
        light: #fff, // white
        highlight: #ff0, // yellow,
        attribute: '[data-state_high-contrast="true"]',
        root_theme: 'dark'
    );
    @import "ct-sass-at-contrast/at-contrast";

### HTML

High contrast styles are applied when a parent element has the high-contrast `attribute` (refer map above).

This can be applied to any wrapper element, including the root (`html`).

This attribute can be applied and toggled using the `ct-jquery-state` plugin.

## Usage

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

Apply a contrast color scheme variation to a module when `[data-state_high-contrast="true"]`:

    .module-xxx {
        @include at-contrast_light;
        @include at-contrast {
            background-color: map-get($at-contrast, dark) !important;
            &,
            * {
                color: green !important;
            }
        }
    }

## Gotchas

Be careful when referencing parent selectors by using the ampersand (`&`) selector.

With this markup:

    <body class="page-home">
        <div data-state_high-contrast="true">
            <div class="m-modulename">

This `.scss`:

    .m-modulename {
        .page-home & {
            border-color: red;
        
            @include at-contrast {
                border-color: black !important;
            }
        }
    }
    
Will produce this `.css`: (where the high contrast rule will never apply)

    .page-home .m-modulename {
        border-color: red;
    }
    [data-state_high-contrast="true"] .page-home .m-modulename {
        border-color: black !important;
    }
    
Whereas this `.scss`:

    .m-modulename {
        .page-home & {
            border-color: red;
        }
        
        @include at-contrast {
            .page-home & {
                border-color: black !important;
            }
        }
    }

Will produce this `.css`: (where the high contrast rule will apply)

    .page-home .m-modulename {
        border-color: red;
    }
    .page-home [data-state_high-contrast="true"] .m-modulename {
        border-color: black !important;
    }
     

## TODO

1. Ideally contrast rules would be in a separate stylesheet. There are currently no clean solutions to this problem (`styleguide.scss` which outputs everything + `.styleguide` rules; 'is' and 'not' mixins).
1. Colour overrides require the `*` selector
1. Add tests, using [getComputedStyle](http://stackoverflow.com/questions/19137507/jquery-equivalent-for-getcomputedstyle)
1. Check if `@include at-contrast &` is another solution to Gotchas example
