angular.module("app", ["ngAnimate", "ngAria", "ngCookies", "uiGmapgoogle-maps", "ngFileUpload", "angularMoment", "ngMessages", "ngResource", "ngSanitize", "ngMaterial", "ngStorage", "ngStore", "ui.router", "ui.utils", "ui.bootstrap", "ui.load", "ui.jp", "pascalprecht.translate", "oc.lazyLoad", "angular-loading-bar","angularFileUpload"]), 
angular.module("app").controller("AppCtrl", ["$scope", "$translate", "$localStorage", "$window", "$document", "$location", "$rootScope", "$timeout", "$mdSidenav", "$mdColorPalette", "$anchorScroll", function(a, b, c, d, e, f, g, h, i, j, k) {
    function l(a) {
        var b = a.navigator.userAgent || a.navigator.vendor || a.opera;
        return /iPhone|iPod|iPad|Silk|Android|BlackBerry|Opera Mini|IEMobile/.test(b)
    }

    function m(a) {
        return "#" + n(a[0]) + n(a[1]) + n(a[2])
    }

    function n(a) {
        var b = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");
        return isNaN(a) ? "00" : b[(a - a % 16) / 16] + b[a % 16]
    }

    function o() {
        a.app.search.content = "", a.app.search.show = !1, a.closeAside(), f.hash("view"), k(), f.hash("")
    }
    var p = !!navigator.userAgent.match(/MSIE/i) || !!navigator.userAgent.match(/Trident.*rv:11\./);
    p && angular.element(d.document.body).addClass("ie"), l(d) && angular.element(d.document.body).addClass("smart"), a.app = {
        name: "APP",
        version: "1.0.0",
        color: {
            primary: "#66bb6a",
            info: "#2196f3",
            success: "#4caf50",
            warning: "#ffc107",
            danger: "#f44336",
            accent: "#7e57c2",
            white: "#ffffff",
            light: "#f1f2f3",
            dark: "#475069"
        },
        setting: {
            theme: {
                primary: "deep-purple",
                accent: "purple",
                warn: "amber"
            },
            asideFolded: !1
        },
        search: {
            content: "",
            show: !1
        }
    }, a.setTheme = function(b) {
        a.app.setting.theme = b
    }, angular.isDefined(c.appSetting) ? a.app.setting = c.appSetting : c.appSetting = a.app.setting, a.$watch("app.setting", function() {
        c.appSetting = a.app.setting
    }, !0), a.langs = {
        en: "English",
        zh_CN: "ä¸­æ–‡"
    }, a.selectLang = a.langs[b.proposedLanguage()] || "English", a.setLang = function(c) {
        a.selectLang = a.langs[c], b.use(c)
    }, a.getColor = function(b, c) {
        return "bg-dark" == b || "bg-white" == b ? a.app.color[b.substr(3, b.length)] : m(j[b][c].value)
    }, g.$on("$stateChangeSuccess", o), a.goBack = function() {
        d.history.back()
    }, a.openAside = function() {
        h(function() {
            i("aside").open()
        })
    }, a.closeAside = function() {
        h(function() {
            e.find("#aside").length && i("aside").close()
        })
    }
}]);
var app = angular.module("app").config(["$controllerProvider", "$compileProvider", "$filterProvider", "$provide", function(a, b, c, d) {
app.controller = a.register, app.directive = b.directive, app.filter = c.register, app.factory = d.factory, app.service = d.service, app.constant = d.constant, app.value = d.value
}]).config(["$translateProvider", function(a) {
a.useStaticFilesLoader({
    prefix: "assets/js/i18n/",
    suffix: ".js"
}), a.preferredLanguage("en"), a.useLocalStorage()
}]);
angular.module("app").constant("MODULE_CONFIG", [{
name: "ui.select",
module: !0,
files: ["./assets/js/libs/angular/angular-ui-select/dist/select.min.js", "./assets/js/libs/angular/angular-ui-select/dist/select.min.css"]
}, {
name: "textAngular",
module: !0,
files: ["./assets/js/libs/angular/textAngular/dist/textAngular-sanitize.min.js", "./assets/js/libs/angular/textAngular/dist/textAngular.min.js"]
}, {
name: "vr.directives.slider",
module: !0,
files: ["./assets/js/libs/angular/venturocket-angular-slider/build/angular-slider.min.js", "./assets/js/libs/angular/venturocket-angular-slider/angular-slider.css"]
}, {
name: "angularBootstrapNavTree",
module: !0,
files: ["./assets/js/libs/angular/angular-bootstrap-nav-tree/dist/abn_tree_directive.js", "./assets/js/libs/angular/angular-bootstrap-nav-tree/dist/abn_tree.css"]
}, {
name: "angularFileUpload",
module: !0,
files: ["./assets/js/libs/angular/angular-file-upload/angular-file-upload.js"]
}, {
name: "ngImgCrop",
module: !0,
files: ["./assets/js/libs/angular/ngImgCrop/compile/minified/ng-img-crop.js", "./assets/js/libs/angular/ngImgCrop/compile/minified/ng-img-crop.css"]
}, {
name: "smart-table",
module: !0,
files: ["./assets/js/libs/angular/angular-smart-table/dist/smart-table.min.js"]
}, {
name: "ui.map",
module: !0,
files: ["./assets/js/libs/angular/angular-ui-map/ui-map.js"]
}, {
name: "ngGrid",
module: !0,
files: ["./assets/js/libs/angular/ng-grid/build/ng-grid.min.js", "./assets/js/libs/angular/ng-grid/ng-grid.min.css", "./assets/js/libs/angular/ng-grid/ng-grid.bootstrap.css"]
}, {
name: "ui.grid",
module: !0,
files: ["./assets/js/libs/angular/angular-ui-grid/ui-grid.min.js", "./assets/js/libs/angular/angular-ui-grid/ui-grid.min.css", "./assets/js/libs/angular/angular-ui-grid/ui-grid.bootstrap.css"]
}, {
name: "xeditable",
module: !0,
files: ["./assets/js/libs/angular/angular-xeditable/dist/js/xeditable.min.js", "./assets/js/libs/angular/angular-xeditable/dist/css/xeditable.css"]
}, {
name: "smart-table",
module: !0,
files: ["./assets/js/libs/angular/angular-smart-table/dist/smart-table.min.js"]
}, {
name: "dataTable",
module: !1,
files: []
}, {
name: "footable",
module: !1,
files: ["./assets/js/libs/jquery/footable/dist/footable.all.min.js", "./assets/js/libs/jquery/footable/css/footable.core.css"]
}, {
name: "easyPieChart",
module: !1,
files: ["./assets/js/libs/jquery/jquery.easy-pie-chart/dist/jquery.easypiechart.fill.js"]
}, {
name: "sparkline",
module: !1,
files: ["./assets/js/libs/jquery/jquery.sparkline/dist/jquery.sparkline.retina.js"]
}, {
name: "plot",
module: !1,
files: ["./assets/js/libs/jquery/flot/jquery.flot.js", "./assets/js/libs/jquery/flot/jquery.flot.resize.js", "./assets/js/libs/jquery/flot/jquery.flot.pie.js", "./assets/js/libs/jquery/flot.tooltip/js/jquery.flot.tooltip.min.js", "./assets/js/libs/jquery/flot-spline/js/jquery.flot.spline.min.js", "./assets/js/libs/jquery/flot.orderbars/js/jquery.flot.orderBars.js"]
}, {
name: "vectorMap",
module: !1,
files: ["./assets/js/libs/jquery/bower-jvectormap/jquery-jvectormap-1.2.2.min.js", "./assets/js/libs/jquery/bower-jvectormap/jquery-jvectormap.css", "./assets/js/libs/jquery/bower-jvectormap/jquery-jvectormap-world-mill-en.js", "./assets/js/libs/jquery/bower-jvectormap/jquery-jvectormap-us-aea-en.js"]
}, {
name: "moment",
module: !1,
files: ["./assets/js/libs/jquery/moment/moment.js"]
}]).config(["$ocLazyLoadProvider", "MODULE_CONFIG", function(a, b) {
a.config({
    debug: !1,
    events: !1,
    modules: b
})
}]), angular.module("app").run(["$rootScope", "$state", "$stateParams", function(a, b, c) {
a.$state = b, a.$stateParams = c
}]).config(["$stateProvider", "$urlRouterProvider", "MODULE_CONFIG", function(a, b, c) {
function d(a, b) {
    return {
        deps: ["$ocLazyLoad", "$q", function(d, e) {
            var f = e.defer(),
                g = !1;
            return a = angular.isArray(a) ? a : a.split(/\s+/), g || (g = f.promise), angular.forEach(a, function(a) {
                g = g.then(function() {
                    return angular.forEach(c, function(b) {
                        b.name == a ? b.module ? name = b.name : name = b.files : name = a
                    }), d.load(name)
                })
            }), f.resolve(), b ? g.then(function() {
                return b()
            }) : g
        }]
    }
}

function e(a) {
    a = a.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var b = new RegExp("[\\?&]" + a + "=([^&#]*)"),
        c = b.exec(location.search);
    return null === c ? "" : decodeURIComponent(c[1].replace(/\+/g, " "))
}
var f = e("layout"),
    g = f ? f + "." : "",
    h = "assets/views/layout." + g + "html",
    i = "assets/views/aside." + g + "html",
    j = "assets/views/content." + g + "html";

b.otherwise("/administracion/usuarios"), a.state("app", {
    "abstract": !0,
    url: "/app",
    views: {
        "": {
            templateUrl: h
        },
        aside: {
            templateUrl: i
        },
        content: {
            templateUrl: j
        }
    }
}).state("app.dashboard", {
    url: "/dashboard",
    templateUrl: "assets/views/pages/dashboard.html",
    data: {
        title: "Dashboard",
        folded: !0
    },
    resolve: d(["assets/js/app/controllers/chart.js", "assets/js/app/controllers/vectormap.js"])
}).state("app.analysis", {
    url: "/analysis",
    templateUrl: "assets/views/pages/dashboard.analysis.html",
    data: {
        title: "Analysis"
    },
    resolve: d(["assets/js/app/controllers/chart.js", "assets/js/app/controllers/vectormap.js"])
}).state("app.wall", {
    url: "/wall",
    templateUrl: "assets/views/pages/dashboard.wall.html",
    data: {
        title: "Wall",
        folded: !0
    }
}).state("app.todo", {
    url: "/todo",
    templateUrl: "apps/todo/todo.html",
    data: {
        title: "Todo",
        theme: {
            primary: "indigo-800"
        }
    },
    controller: "TodoCtrl",
    resolve: d("apps/todo/todo.js")
}).state("app.todo.list", {
    url: "/{fold}"
}).state("app.note", {
    url: "/note",
    templateUrl: "apps/note/main.html",
    data: {
        theme: {
            primary: "blue-grey"
        }
    }
}).state("app.note.list", {
    url: "/list",
    templateUrl: "apps/note/list.html",
    data: {
        title: "Note"
    },
    controller: "NoteCtrl",
    resolve: d(["apps/note/note.js", "moment"])
}).state("app.note.item", {
    url: "/{id}",
    views: {
        "": {
            templateUrl: "apps/note/item.html",
            controller: "NoteItemCtrl",
            resolve: d(["apps/note/note.js", "moment"])
        },
        "navbar@": {
            templateUrl: "apps/note/navbar.html",
            controller: "NoteItemCtrl"
        }
    },
    data: {
        title: "",
        child: !0
    }
}).state("app.inbox", {
    url: "/inbox",
    templateUrl: "apps/inbox/inbox.html",
    data: {
        title: "Inbox",
        folded: !0
    },
    resolve: d(["apps/inbox/inbox.js", "moment"])
}).state("app.inbox.list", {
    url: "/inbox/{fold}",
    templateUrl: "apps/inbox/list.html"
}).state("app.inbox.detail", {
    url: "/{id:[0-9]{1,4}}",
    templateUrl: "apps/inbox/detail.html"
}).state("app.inbox.compose", {
    url: "/compose",
    templateUrl: "apps/inbox/new.html",
    resolve: d(["textAngular", "ui.select"])
}).state("ui", {
    url: "/ui",
    "abstract": !0,
    views: {
        "": {
            templateUrl: h
        },
        aside: {
            templateUrl: i
        },
        content: {
            templateUrl: j
        }
    }
}).state("ui.component", {
    url: "/component",
    "abstract": !0,
    template: "<div ui-view></div>"
}).state("ui.component.arrow", {
    url: "/arrow",
    templateUrl: "assets/views/ui/component/arrow.html",
    data: {
        title: "Arrows"
    }
}).state("ui.component.badge-label", {
    url: "/badge-label",
    templateUrl: "assets/views/ui/component/badge-label.html",
    data: {
        title: "Badges & Labels"
    }
}).state("ui.component.button", {
    url: "/button",
    templateUrl: "assets/views/ui/component/button.html",
    data: {
        title: "Buttons"
    }
}).state("ui.component.color", {
    url: "/color",
    templateUrl: "assets/views/ui/component/color.html",
    data: {
        title: "Colors"
    }
}).state("ui.component.grid", {
    url: "/grid",
    templateUrl: "assets/views/ui/component/grid.html",
    data: {
        title: "Grids"
    }
}).state("ui.component.icon", {
    url: "/icons",
    templateUrl: "assets/views/ui/component/icon.html",
    data: {
        title: "Icons"
    }
}).state("ui.component.list", {
    url: "/list",
    templateUrl: "assets/views/ui/component/list.html",
    data: {
        title: "Lists"
    }
}).state("ui.component.nav", {
    url: "/nav",
    templateUrl: "assets/views/ui/component/nav.html",
    data: {
        title: "Navs"
    }
}).state("ui.component.progressbar", {
    url: "/progressbar",
    templateUrl: "assets/views/ui/component/progressbar.html",
    data: {
        title: "Progressbars"
    }
}).state("ui.component.streamline", {
    url: "/streamline",
    templateUrl: "assets/views/ui/component/streamline.html",
    data: {
        title: "Streamlines"
    }
}).state("ui.component.timeline", {
    url: "/timeline",
    templateUrl: "assets/views/ui/component/timeline.html",
    data: {
        title: "Timelines"
    }
}).state("ui.component.uibootstrap", {
    url: "/uibootstrap",
    templateUrl: "assets/views/ui/component/uibootstrap.html",
    resolve: d("assets/js/app/controllers/bootstrap.js"),
    data: {
        title: "UI Bootstrap"
    }
}).state("ui.material", {
    url: "/material",
    template: "<div ui-view></div>",
    resolve: d("assets/js/app/controllers/material.js")
}).state("ui.material.button", {
    url: "/button",
    templateUrl: "assets/views/ui/material/button.html",
    data: {
        title: "Buttons"
    }
}).state("ui.material.color", {
    url: "/color",
    templateUrl: "assets/views/ui/material/color.html",
    data: {
        title: "Colors"
    }
}).state("ui.material.icon", {
    url: "/icon",
    templateUrl: "assets/views/ui/material/icon.html",
    data: {
        title: "Icons"
    }
}).state("ui.material.card", {
    url: "/card",
    templateUrl: "assets/views/ui/material/card.html",
    data: {
        title: "Card"
    }
}).state("ui.material.form", {
    url: "/form",
    templateUrl: "assets/views/ui/material/form.html",
    data: {
        title: "Form"
    }
}).state("ui.material.list", {
    url: "/list",
    templateUrl: "assets/views/ui/material/list.html",
    data: {
        title: "List"
    }
}).state("ui.material.ngmaterial", {
    url: "/ngmaterial",
    templateUrl: "assets/views/ui/material/ngmaterial.html",
    data: {
        title: "NG Material"
    }
}).state("ui.form", {
    url: "/form",
    template: "<div ui-view></div>"
}).state("ui.form.layout", {
    url: "/layout",
    templateUrl: "assets/views/ui/form/layout.html",
    data: {
        title: "Layouts"
    }
}).state("ui.form.element", {
    url: "/element",
    templateUrl: "assets/views/ui/form/element.html",
    data: {
        title: "Elements"
    }
}).state("ui.form.validation", {
    url: "/validation",
    templateUrl: "assets/views/ui/form/validation.html",
    data: {
        title: "Validations"
    }
}).state("ui.form.select", {
    url: "/select",
    templateUrl: "assets/views/ui/form/select.html",
    data: {
        title: "Selects"
    },
    controller: "SelectCtrl",
    resolve: d(["ui.select", "assets/js/app/controllers/select.js"])
}).state("ui.form.editor", {
    url: "/editor",
    templateUrl: "assets/views/ui/form/editor.html",
    data: {
        title: "Editor"
    },
    controller: "EditorCtrl",
    resolve: d(["textAngular", "assets/js/app/controllers/editor.js"])
}).state("ui.form.slider", {
    url: "/slider",
    templateUrl: "assets/views/ui/form/slider.html",
    data: {
        title: "Slider"
    },
    controller: "SliderCtrl",
    resolve: d("assets/js/app/controllers/slider.js")
}).state("ui.form.tree", {
    url: "/tree",
    templateUrl: "assets/views/ui/form/tree.html",
    data: {
        title: "Tree"
    },
    controller: "TreeCtrl",
    resolve: d("assets/js/app/controllers/tree.js")
}).state("ui.form.file-upload", {
    url: "/file-upload",
    templateUrl: "assets/views/ui/form/file-upload.html",
    data: {
        title: "File upload"
    },
    controller: "UploadCtrl",
    resolve: d(["angularFileUpload", "assets/js/app/controllers/upload.js"])
}).state("ui.form.image-crop", {
    url: "/image-crop",
    templateUrl: "assets/views/ui/form/image-crop.html",
    data: {
        title: "Image Crop"
    },
    controller: "ImgCropCtrl",
    resolve: d(["ngImgCrop", "assets/js/app/controllers/imgcrop.js"])
}).state("ui.form.editable", {
    url: "/editable",
    templateUrl: "assets/views/ui/form/xeditable.html",
    data: {
        title: "Xeditable"
    },
    controller: "XeditableCtrl",
    resolve: d(["xeditable", "assets/js/app/controllers/xeditable.js"])
}).state("ui.table", {
    url: "/table",
    template: "<div ui-view></div>"
}).state("ui.table.static", {
    url: "/static",
    templateUrl: "assets/views/ui/table/static.html",
    data: {
        title: "Static",
        theme: {
            primary: "blue"
        }
    }
}).state("ui.table.smart", {
    url: "/smart",
    templateUrl: "assets/views/ui/table/smart.html",
    data: {
        title: "Smart"
    },
    controller: "TableCtrl",
    resolve: d(["smart-table", "assets/js/app/controllers/table.js"])
}).state("ui.table.datatable", {
    url: "/datatable",
    data: {
        title: "Datatable"
    },
    templateUrl: "assets/views/ui/table/datatable.html"
}).state("ui.table.footable", {
    url: "/footable",
    data: {
        title: "Footable"
    },
    templateUrl: "assets/views/ui/table/footable.html"
}).state("ui.table.nggrid", {
    url: "/nggrid",
    templateUrl: "assets/views/ui/table/nggrid.html",
    data: {
        title: "NG Grid"
    },
    controller: "NGGridCtrl",
    resolve: d(["ngGrid", "assets/js/app/controllers/nggrid.js"])
}).state("ui.table.uigrid", {
    url: "/uigrid",
    templateUrl: "assets/views/ui/table/uigrid.html",
    data: {
        title: "UI Grid"
    },
    controller: "UiGridCtrl",
    resolve: d(["ui.grid", "assets/js/app/controllers/uigrid.js"])
}).state("ui.table.editable", {
    url: "/editable",
    templateUrl: "assets/views/ui/table/editable.html",
    data: {
        title: "Editable"
    },
    controller: "XeditableCtrl",
    resolve: d(["xeditable", "assets/js/app/controllers/xeditable.js"])
}).state("ui.chart", {
    url: "/chart",
    templateUrl: "assets/views/ui/chart/chart.html",
    data: {
        title: "Charts"
    },
    resolve: d("assets/js/app/controllers/chart.js")
}).state("ui.map", {
    url: "/map",
    template: "<div ui-view></div>"
}).state("ui.map.google", {
    url: "/google",
    templateUrl: "assets/views/ui/map/google.html",
    data: {
        title: "Gmap"
    },
    controller: "GoogleMapCtrl",
    resolve: d(["ui.map", "assets/js/app/controllers/load-google-maps.js", "assets/js/app/controllers/googlemap.js"], function() {
        return loadGoogleMaps()
    })
}).state("ui.map.vector", {
    url: "/vector",
    templateUrl: "assets/views/ui/map/vector.html",
    data: {
        title: "Vector"
    },
    controller: "VectorMapCtrl",
    resolve: d("assets/js/app/controllers/vectormap.js")
}).state("page", {
    url: "/page",
    views: {
        "": {
            templateUrl: h
        },
        aside: {
            templateUrl: i
        },
        content: {
            templateUrl: j
        }
    }
}).state("page.profile", {
    url: "/profile",
    templateUrl: "assets/views/pages/profile.html",
    data: {
        title: "Profile",
        theme: {
            primary: "green"
        }
    }
}).state("page.settings", {
    url: "/settings",
    templateUrl: "assets/views/pages/settings.html",
    data: {
        title: "Settings"
    }
}).state("page.blank", {
    url: "/blank",
    templateUrl: "assets/views/pages/blank.html",
    data: {
        title: "Blank"
    }
}).state("page.document", {
    url: "/document",
    templateUrl: "assets/views/pages/document.html",
    data: {
        title: "Document"
    }
}).state("404", {
    url: "/404",
    templateUrl: "assets/views/pages/404.html"
}).state("505", {
    url: "/505",
    templateUrl: "assets/views/pages/505.html"
})
}]), angular.module("app").directive("lazyLoad", ["MODULE_CONFIG", "$ocLazyLoad", "$compile", function(a, b, c) {
return {
    restrict: "A",
    compile: function(d, e) {
        var f, g = d.contents().remove();
        return function(d, e, h) {
            angular.forEach(a, function(a) {
                a.name == h.lazyLoad && (f = a.module ? a.name : a.files)
            }), b.load(f).then(function() {
                c(g)(d, function(a, b) {
                    e.append(a)
                })
            })
        }
    }
}
}]), angular.module("app").directive("uiFullscreen", ["$ocLazyLoad", "$document", function(a, b) {
return {
    restrict: "AC",
    link: function(c, d, e) {
        d.addClass("hide"), a.load("./assets/js/libs/jquery/screenfull/dist/screenfull.min.js").then(function() {
            if (screenfull.enabled) {
                d.removeClass("hide"), d.bind("click", function() {
                    var a;
                    e.target && (a = angular.element(e.target)[0]), screenfull.toggle(a)
                });
                var a = angular.element(b[0].body);
                b.on(screenfull.raw.fullscreenchange, function() {
                    screenfull.isFullscreen ? a.addClass("fullscreen") : a.removeClass("fullscreen")
                })
            }
        })
    }
}
}]), angular.module("ui.jp", ["oc.lazyLoad", "ui.load"]).value("uiJpConfig", {}).directive("uiJp", ["uiJpConfig", "MODULE_CONFIG", "uiLoad", "$timeout", function(a, b, c, d) {
return {
    restrict: "A",
    compile: function(e, f) {
        var g = a && a[f.uiJp];
        return function(a, e, f) {
            function h() {
                var b = [];
                return f.uiOptions ? (b = a.$eval("[" + f.uiOptions + "]"), angular.isObject(g) && angular.isObject(b[0]) && (b[0] = angular.extend({}, g, b[0]))) : g && (b = [g]), b
            }

            function i() {
                d(function() {
                    $(e)[f.uiJp].apply($(e), h())
                }, 0, !1)
            }

            function j() {
                f.uiRefresh && a.$watch(f.uiRefresh, function() {
                    i()
                })
            }
            f.ngModel && e.is("select,input,textarea") && e.bind("change", function() {
                e.trigger("input")
            });
            
            
                var k = !1;
                angular.forEach(b, function(a) {
                    a.name == f.uiJp && (k = a.files)
                }), k ? c.load(k).then(function() {
                    i(), j()
                })["catch"](function() {}) : (i(), j())
            

        }
    }
}
}]), angular.module("app").directive("uiNav", ["$timeout", function(a) {
return {
    restrict: "AC",
    link: function(a, b, c) {
        b.find("a").bind("click", function(a) {
            var b = angular.element(this).parent(),
                c = b.parent()[0].querySelectorAll(".active");
            b.toggleClass("active"), angular.element(c).removeClass("active")
        })
    }
}
}]), angular.module("app").directive("uiScroll", ["$location", "$anchorScroll", function(a, b) {
return {
    restrict: "AC",
    replace: !0,
    link: function(c, d, e) {
        d.bind("click", function(c) {
            a.hash(e.uiScroll), b()
        })
    }
}
}]), angular.module("app").directive("uiToggleClass", ["$timeout", "$document", function(a, b) {
return {
    restrict: "AC",
    link: function(a, b, c) {
        b.on("click", function(a) {
            a.preventDefault();
            var d = c.uiToggleClass.split(","),
                e = c.target && c.target.split(",") || Array(b),
                f = 0;
            angular.forEach(d, function(a) {
                var b = e[e.length && f];
                $(b).toggleClass(a), f++
            }), b.toggleClass("active")
        })
    }
}
}]), angular.module("ngStore", []).provider("ngStore", [function() {
return {
    $get: ["NSModelFactory", function(a) {
        return {
            model: function(b) {
                var c = new a(b);
                return c
            }
        }
    }]
}
}]).factory("NSModelFactory", ["$log", function(a) {
function b(a, b) {
    if (!this.localStorage) throw "localStorage: Environment does not support localStorage.";
    this.name = a, this.serializer = b || {
        serialize: function(a) {
            return e(a) ? JSON.stringify(a) : a
        },
        deserialize: function(a) {
            return a && JSON.parse(a)
        }
    };
    var c = this.localStorage().getItem(this.name);
    this.records = c && c.split(",") || []
}

function c() {
    return (65536 * (1 + Math.random()) | 0).toString(16).substring(1)
}

function d() {
    return c() + c() + "-" + c() + "-" + c() + "-" + c() + "-" + c() + c() + c()
}

function e(a) {
    return a === Object(a)
}

function f(a, b) {
    for (var c = a.length; c--;)
        if (a[c] === b) return !0;
    return !1
}
return b.prototype = {
    save: function() {
        this.localStorage().setItem(this.name, this.records.join(","))
    },
    create: function(a) {
        return a.id || 0 === a.id || (a.id = d(), a.set(a.idAttribute, a.id)), this.localStorage().setItem(this._itemName(a.id), this.serializer.serialize(a)), this.records.push(a.id.toString()), this.save(), this.find(a)
    },
    update: function(a) {
        this.localStorage().setItem(this._itemName(a.id), this.serializer.serialize(a));
        var b = a.id.toString();
        return f(this.records, b) || (this.records.push(b), this.save()), this.find(a)
    },
    find: function(a) {
        return this.serializer.deserialize(this.localStorage().getItem(this._itemName(a.id)))
    },
    findAll: function() {
        for (var a, b, c = [], d = 0; d < this.records.length; d++) a = this.records[d], b = this.serializer.deserialize(this.localStorage().getItem(this._itemName(a))), null != b && c.push(b);
        return c
    },
    destroy: function(a) {
        this.localStorage().removeItem(this._itemName(a.id));
        for (var b = a.id.toString(), c = 0; c < this.records.length; c++) this.records[c] === b && this.records.splice(c, 1);
        return this.save(), a
    },
    nextId: function() {
        return 0 == this.records.length ? 1 : Number(this.records[this.records.length - 1]) + 1
    },
    localStorage: function() {
        return localStorage
    },
    _clear: function() {
        var a = this.localStorage(),
            b = new RegExp("^" + this.name + "-");
        a.removeItem(this.name);
        for (var c in a) b.test(c) && a.removeItem(c);
        this.records.length = 0
    },
    _storageSize: function() {
        return this.localStorage().length
    },
    _itemName: function(a) {
        return this.name + "-" + a
    }
}, b
}]), angular.module("ui.load", []).service("uiLoad", ["$document", "$q", "$timeout", function(a, b, c) {
var d = [],
    e = !1,
    f = b.defer();
this.load = function(a) {
    a = angular.isArray(a) ? a : a.split(/\s+/);
    var b = this;
    return e || (e = f.promise), angular.forEach(a, function(a) {
        e = e.then(function() {
            return a.indexOf(".css") >= 0 ? b.loadCSS(a) : b.loadScript(a)
        })
    }), f.resolve(), e
}, this.loadScript = function(e) {
    if (d[e]) return d[e].promise;
    var f = b.defer(),
        g = a[0].createElement("script");
    return g.src = e, g.onload = function(a) {
        c(function() {
            f.resolve(a)
        })
    }, g.onerror = function(a) {
        c(function() {
            f.reject(a)
        })
    }, a[0].body.appendChild(g), d[e] = f, f.promise
}, this.loadCSS = function(e) {
    if (d[e]) return d[e].promise;
    var f = b.defer(),
        g = a[0].createElement("link");
    return g.rel = "stylesheet", g.type = "text/css", g.href = e, g.onload = function(a) {
        c(function() {
            f.resolve(a)
        })
    }, g.onerror = function(a) {
        c(function() {
            f.reject(a)
        })
    }, a[0].head.appendChild(g), d[e] = f, f.promise
}
}]), angular.module("app").filter("fromNow", function() {
return function(a) {
    return moment(a).fromNow()
}
});

