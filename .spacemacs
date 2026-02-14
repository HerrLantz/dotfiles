;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '((shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/zsh")
     raku
     csv
     (spotify :variables
              counsel-spotify-client-id "66be75be57b84de69e5af712cdd4b11b"
              counsel-spotify-client-secret "5677f440d3d540faac4982ed703d1bf0")
     toml
     sql
     (html :variables
           web-fmt-tool 'prettier)
     (yaml :variables
           yaml-enable-lsp t)
     (terraform :variables
                terraform-backend 'lsp
                terraform-format-on-save t)
     (typescript :variables
                 typescript-backend 'tide
                 typescript-linter 'eslint
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 javascript-indent-level 2
                 tree-sitter-syntax-highlight-enable t
                 node-add-modules-path "node_modules/")
     (go :variables
         go-backend 'lsp
         go-tab-width 2
         go-format-before-save t
         go-use-golangci-lint t
         go-dap-mode 'dap-go)
     dap
     (python :variables
             python-backend 'lsp
             python-test-runner 'pytest
             python-format-on-save t
             python-formatter 'ruff
             python-save-before-test t
             python-enable-tools '(uv)
             python-sort-imports-on-save t
             python-tab-width 2)
     (auto-completion :variables
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 0.0
                      spacemacs-default-company-backends '(company-files company-capf))
     (lsp :variables
          lsp-headerline-breadcrumb-enable t              ; Breadcrumb trail
          lsp-headerline-breadcrumb-segments '(symbols)   ; namespace & symbols, no file path
          lsp-ui-peek-enable nil                          ; popups for refs, errors, symbols, etc.
          lsp-semantic-tokens-enable t                    ; enhance syntax highlight
          lsp-treemacs-error-list-current-project-only t  ; limit errors to current project
          lsp-idle-delay 1.5                              ; smooth LSP features response
          lsp-eldoc-enable-hover nil                      ; disable all hover actions
          lsp-ui-doc-enable nil                           ; doc hover popups
          lsp-ui-sideline-enable nil                      ; sidebar code actions visual indicator
          treemacs-space-between-root-nodes nil           ; spacing in treemacs views
          lsp-log-io t                                    ; Log client-server json communication
          )
     (ranger :variables
             ranger-show-preview t)
     imenu-list
     ;; better-defaults
     search-engine
     (emacs-lisp :variables
                 smartparens-strict-mode t
                 aggresive-indent-mode t
                 evil-safe-lisp-structural-editing t)
     (unicode-fonts :variables unicode-fonts-enable-ligatures t)
     (git :variables
          git-enable-magit-delta-plugin t
          git-enable-magit-git-flowflow-plugin t
          git-enable-magit-svn-plugin t
          git-enable-magit-todos-plugin t)
     (helm :variables
           helm-grep-file-path-style 'relative
           helm-use-fuzzy 'source
           helm-ag-fuzzy-match t
           helm-grep-ignored-directories '("node_modules" "dist" ".clj-kondo"))
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     multiple-cursors
     (clojure :variables
              clojure-enable-fancify-symbols t
              clojure-backend 'cider                 ; use cider and disable lsp
              clojure-enable-kaocha-runner t            ; enable Kaocha test runner
              cider-repl-display-help-banner nil        ; disable help banner
              ;; cider-print-fn 'puget                     ; pretty printing with sorted keys / set values
              clojure-indent-style 'align-arguments
              clojure-align-forms-automatically t
              clojure-toplevel-inside-comment-form t ; clashes with LSP
              cider-result-overlay-position 'at-point   ; results shown right after expression
              cider-overlays-use-font-lock t
              smartparens-strict-mode t
              clojure-enable-linters 'clj-kondo
              clojure-enable-clj-refactor t
              ;; cider-repl-buffer-size-limit 100          ; limit lines shown in REPL buffer
              nrepl-use-ssh-fallback-for-remote-hosts t ; connect via ssh to remote hosts
              )
     (tree-sitter :variables
                  tree-sitter-syntax-highlight-enable t)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t
                      syntax-checking-enable-by-default t)
     (json :variables
           json-fmt-on-save t
           json-backend 'lsp
           js-indent-level 2
           json-fmt-tool 'prettier)
     (osx :variables
          osx-use-option-as-meta nil)
     prolog
     emacs-lisp
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)
     (spacemacs-modeline :variables
                         doom-modeline-height 12
                         doom-modeline-bar-width 0                  ; size of bar icon at start of modeline
                         doom-modeline-buffer-state-icon t          ; disk icon for unsaved changes (default)
                         doom-modeline-major-mode-color-icon t      ; color icon of major mode
                         doom-modeline-buffer-file-name-style 'relative-to-project
                         doom-modeline-display-default-persp-name t ; layout name
                         doom-modeline-minor-modes nil              ; show minor modes
                         doom-modeline-modal nil                    ; show Evil state icon/text
                         ;; doom-modeline-modal-icon t              ; icon when t, ascii when nil
                         doom-modeline-buffer-encoding nil          ; remove UTF-8, etc.
                         )
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     )
   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(yasnippet-snippets
                                      add-node-modules-path
                                      jest-test-mode)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Fira Code"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:visual t
                                       :disabled-for-modes dired-mode
                                       doc-view-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-tree

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; UNDO TREE STOP BEING ANNOYING
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

  (when (daemonp)
    (require 'exec-path-from-shell)
    (exec-path-from-shell-initialize))

  ;; =========================== ESLINT CONFIG ===========================
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint
            (and root
                 (expand-file-name "../../node_modules/.bin/eslint"
                                   root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (add-hook 'typescript-mode-hook #'tree-sitter-hl-mode)
  ;; ================== END OF ESLINT CONFIG ===========================

  ;; ======================== CLOJURE CONFIG ===========================
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-emacs-lisp-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (setq cider-jack-in-default 'lein)

  (require 'clojure-mode)

  (define-clojure-indent
   (defroutes 'defun)
   (GET 2)
   (POST 2)
   (PUT 2)
   (DELETE 2)
   (HEAD 2)
   (ANY 2)
   (OPTIONS 2)
   (PATCH 2)
   (rfn 2)
   (let-routes 1)
   (context 2))
  ;; ================== END OF CLOJURE CONFIG ===========================

  ;; =========================== TITLE BAR STUFF ===========================
  ;; (defvar title-messages '("IntelliJ"
  ;;                          "Sublime Text"
  ;;                          "vscode"))
  ;; (setq frame-title-format (nth (random (length title-messages)) title-messages))
  (setq frame-title-format "Spacemacs!!!")
  ;; (defun set-title-message (&rest wow)
  ;;   (setq frame-title-format (nth (random (length title-messages)) title-messages)))

  ;; (add-to-list 'window-buffer-change-functions #'set-title-message)

  ;; ===================== END OF TITLE BAR STUFF ========================

  (setq case-replace nil)
  (setq scroll-margin 10)

  (eval-after-load "auto-complete"
    '(add-to-list 'ac-source-yasnippet))

  ;; Rebind ` to q in evil-mode
  (define-key evil-normal-state-map (kbd "q") 'evil-goto-mark)
  (define-key evil-visual-state-map (kbd "q") 'evil-goto-mark)
  (define-key evil-normal-state-map (kbd "!") 'evil-last-non-blank)
  (define-key evil-visual-state-map (kbd "!") 'evil-last-non-blank)

  (setq mac-option-modifier nil
        x-select-enable-clipboard t)

  (global-flycheck-mode)

  ;; Typescript jest testing
  (add-hook 'typescript-mode-hook #'jest-test-mode)
  (spacemacs/declare-prefix-for-mode 'typescript-mode "mo" "testing")
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "ot" 'jest-test-run-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "oT" 'jest-test-debug-run-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "ob" 'jest-test-run)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "op" 'jest-test-run-all-tests)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "or" 'jest-test-rerun-test)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "oR" 'jest-test-debug-rerun-test)

  ;; Company mode speedup?
  ;; (setq company-lsp-cache-candidates t)

  ;; Transparent title bar
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . :never))
  (set-frame-parameter nil 'ns-appearance 'dark)
  (setq ns-use-proxy-icon nil)

  (setq dired-kill-when-opening-new-dired-buffer t)
  ;; WEB STUFF

  (add-to-list 'exec-path "node_modules/.bin" t)
  (setq-default
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(flycheck-checker-error-threshold 800)
   '(package-selected-packages
     '(ace-jump-helm-line ace-link ace-window add-node-modules-path afternoon-theme
                          aggressive-indent alect-themes all-the-icons ample-theme
                          ample-zen-theme anaconda-mode annalist
                          anti-zenburn-theme anzu apropospriate-theme async
                          auto-compile auto-highlight-symbol auto-yasnippet
                          autothemer avy badwolf-theme bind-map
                          birds-of-paradise-plus-theme blacken browse-at-remote
                          bubbleberry-theme bui busybee-theme centered-cursor-mode
                          cfrs cherry-blossom-theme chocolate-theme cider
                          cider-eval-sexp-fu clang-format clean-aindent-mode
                          clj-refactor clojure-mode clojure-snippets closql
                          clues-theme code-cells color-theme-sanityinc-solarized
                          color-theme-sanityinc-tomorrow column-enforce-mode
                          company company-anaconda company-box company-go
                          company-quickhelp company-statistics company-terraform
                          company-web compat concurrent counsel counsel-css
                          csv-mode ctable cyberpunk-theme cython-mode
                          dakrone-theme dap-mode darkmine-theme darkokai-theme
                          darktooth-theme dash define-word devdocs diff-hl
                          diminish dired-quick-sort django-theme dockerfile-mode
                          doom-themes dotenv-mode dracula-theme drag-stuff
                          dumb-jump eat ediprolog editorconfig elfeed
                          elfeed-goodies elfeed-org elisp-def elisp-slime-nav
                          emacsql emmet-mode emr engine-mode epc epl esh-help
                          eshell-prompt-extras eshell-z espresso-theme
                          eval-sexp-fu evil evil-anzu evil-args evil-cleverparens
                          evil-collection evil-easymotion evil-escape
                          evil-evilified-state evil-exchange evil-goggles
                          evil-iedit-state evil-indent-plus evil-lion
                          evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
                          evil-numbers evil-surround evil-textobj-line evil-tutor
                          evil-unimpaired evil-vimish-fold evil-visual-mark-mode
                          evil-visualstar exec-path-from-shell exotica-theme
                          expand-region eyebrowse eziam-themes f fancy-battery
                          farmhouse-themes flatland-theme flatui-theme floobits
                          flx flx-ido flycheck flycheck-clj-kondo flycheck-elsa
                          flycheck-package flycheck-pos-tip flycheck-raku
                          flymake-golangci font-utils forge frame-local
                          fringe-helper gandalf-theme ggtags gh-md ghub git-commit
                          git-link git-messenger git-modes git-timemachine
                          gitignore-templates go-eldoc go-fill-struct go-gen-test
                          go-guru go-impl go-mode go-rename go-tag godoctor
                          golden-ratio google-translate gotham-theme goto-chg
                          grandshell-theme graphviz-dot-mode grizzl groovy-imports
                          groovy-mode gruber-darker-theme gruvbox-theme haml-mode
                          hc-zenburn-theme hcl-mode helm helm-ag helm-c-yasnippet
                          helm-cider helm-comint helm-company helm-core
                          helm-cscope helm-css-scss helm-descbinds helm-git-grep
                          helm-ls-git helm-lsp helm-make helm-mode-manager
                          helm-org helm-projectile helm-purpose helm-pydoc
                          helm-spotify-plus helm-swoop helm-themes helm-xref
                          hemisu-theme heroku-theme hide-comnt hierarchy highlight
                          highlight-indent-guides highlight-indentation
                          highlight-numbers highlight-parentheses hl-todo
                          holy-mode ht htmlize hungry-delete hydra iedit
                          imenu-list impatient-mode import-js importmagic
                          indent-guide inflections info+ inkpot-theme inspector
                          ir-black-theme ivy jazz-theme jbeans-theme
                          jest-test-mode journalctl-mode jq-mode js-doc js2-mode
                          js2-refactor json-mode json-navigator json-reformat
                          json-snatcher kaocha-runner kaolin-themes launchctl
                          ligature light-soap-theme link-hint list-utils
                          live-py-mode livid-mode load-env-vars lorem-ipsum
                          lsp-docker lsp-origami lsp-pyright lsp-treemacs lsp-ui
                          lush-theme lv macrostep madhat2r-theme magit magit-delta
                          magit-section magit-svn magit-todos majapahit-themes
                          markdown-mode markdown-toc material-theme
                          maven-test-mode minimal-theme mmt modus-themes moe-theme
                          molokai-theme monochrome-theme monokai-theme multi
                          multi-line multi-term multi-vterm multiple-cursors
                          mustang-theme mvn nameless naquadah-theme noctilux-theme
                          nodejs-repl nose npm-mode obsidian-theme
                          occidental-theme oldlace-theme omtose-phellack-theme
                          open-junk-file org-superstar organic-green-theme origami
                          osx-clipboard osx-dictionary osx-trash overseer
                          package-lint paradox paredit parent-mode parseclj
                          parseedn password-generator pcache pcre2el
                          persistent-soft persp-mode pet pfuture
                          phoenix-dark-mono-theme phoenix-dark-pink-theme
                          pip-requirements pipenv pippel pkg-info planet-theme
                          poetry popup popwin pos-tip posframe powerline
                          prettier-js prisma-ts-mode professional-theme projectile
                          pug-mode purple-haze-theme py-isort pydoc pyenv-mode
                          pylookup python-django python-pytest pythonic pyvenv
                          queue quickrun railscasts-theme rainbow-delimiters
                          raku-mode ranger rebecca-theme reformatter request
                          restart-emacs reveal-in-osx-finder reverse-theme
                          rjsx-mode ron-mode ruff-format rust-mode rustic s
                          sass-mode scss-mode seq sesman seti-theme shell-pop
                          shut-up simple-httpd skewer-mode slim-mode smartparens
                          smeargle smyx-theme soft-charcoal-theme
                          soft-morning-theme soft-stone-theme solarized-theme
                          soothe-theme space-doc spacegray-theme spaceline
                          spacemacs-purpose-popwin spacemacs-whitespace-cleanup
                          sphinx-doc spinner spotify sql-indent sqlup-mode
                          string-edit-at-point string-inflection subatomic-theme
                          subatomic256-theme sublime-themes sunny-day-theme
                          swift-mode swiper symbol-overlay symon systemd tagedit
                          tango-2-theme tango-plus-theme tangotango-theme
                          tao-theme term-cursor terminal-here terraform-mode tide
                          toc-org toml-mode toxi-theme transient tree-sitter
                          tree-sitter-langs treemacs treemacs-evil
                          treemacs-icons-dired treemacs-magit treemacs-persp
                          treemacs-projectile treepy ts-comint ts-fold tsc
                          twilight-anti-bright-theme twilight-bright-theme
                          twilight-theme typescript-mode typit ucs-utils
                          ujelly-theme underwater-theme undo-tree unicode-fonts
                          uuidgen uv vi-tilde-fringe vim-powerline vimish-fold
                          visual-fill-column vmd-mode volatile-highlights vterm
                          web-beautify web-completion-data web-mode wfnames
                          which-key white-sand-theme window-purpose winum
                          with-editor writeroom-mode ws-butler xcscope xterm-color
                          yaml yaml-mode yapfify yasnippet yasnippet-snippets
                          zen-and-art-theme zenburn-theme zone-nyan zonokai-emacs))
   '(standard-indent 2)
   '(typescript-indent-level 2))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
