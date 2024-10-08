CLASS z2ui5_cl_app_test_locate-reuse-libs_js DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS z2ui5_cl_app_test_locate-reuse-libs_js IMPLEMENTATION.

  METHOD get.

    result =              `(function (sap) {` && |\n|  &&
             `    var fioriToolsGetManifestLibs = function (manifestPath) {` && |\n|  &&
             `        var url = manifestPath;` && |\n|  &&
             `        var result = "";` && |\n|  &&
             `        // SAPUI5 delivered namespaces from https://ui5.sap.com/#/api/sap` && |\n|  &&
             `        var ui5Libs = [` && |\n|  &&
             `            "sap.apf",` && |\n|  &&
             `            "sap.base",` && |\n|  &&
             `            "sap.chart",` && |\n|  &&
             `            "sap.collaboration",` && |\n|  &&
             `            "sap.f",` && |\n|  &&
             `            "sap.fe",` && |\n|  &&
             `            "sap.fileviewer",` && |\n|  &&
             `            "sap.gantt",` && |\n|  &&
             `            "sap.landvisz",` && |\n|  &&
             `            "sap.m",` && |\n|  &&
             `            "sap.ndc",` && |\n|  &&
             `            "sap.ovp",` && |\n|  &&
             `            "sap.rules",` && |\n|  &&
             `            "sap.suite",` && |\n|  &&
             `            "sap.tnt",` && |\n|  &&
             `            "sap.ui",` && |\n|  &&
             `            "sap.uiext",` && |\n|  &&
             `            "sap.ushell",` && |\n|  &&
             `            "sap.uxap",` && |\n|  &&
             `            "sap.viz",` && |\n|  &&
             `            "sap.webanalytics",` && |\n|  &&
             `            "sap.zen"` && |\n|  &&
             `        ];` && |\n|  &&
             `        function getKeys(libOrComp, libOrCompKeysString) {` && |\n|  &&
             `            var libOrCompKeysStringTmp = libOrCompKeysString;` && |\n|  &&
             `            Object.keys(libOrComp).forEach(function (libOrCompKey) {` && |\n|  &&
             `                // ignore libs or Components that start with SAPUI5 delivered namespaces` && |\n|  &&
             `                if (!ui5Libs.some(function (substring) { return libOrCompKey === substring || libOrC` && |\n|  &&
             `ompKey.startsWith(substring + "."); })) {` && |\n|  &&
             `                    if (libOrCompKeysStringTmp.length > 0) {` && |\n|  &&
             `                        libOrCompKeysStringTmp = libOrCompKeysStringTmp + "," + libOrCompKey;` && |\n|  &&
             `                    } else {` && |\n|  &&
             `                        libOrCompKeysStringTmp = libOrCompKey;` && |\n|  &&
             `                    }` && |\n|  &&
             `                }` && |\n|  &&
             `            });` && |\n|  &&
             `            return libOrCompKeysStringTmp;` && |\n|  &&
             `        }` && |\n|  &&
             `        function getComponentUsageNames(compUsages, libOrCompKeysString) {` && |\n|  &&
             `            var libOrCompKeysStringTmp = libOrCompKeysString;` && |\n|  &&
             `            var compNames = Object.keys(compUsages).map(function (compUsageKey) {` && |\n|  &&
             `                return compUsages[compUsageKey].name;` && |\n|  &&
             `            });` && |\n|  &&
             `            compNames.forEach(function (compName) {` && |\n|  &&
             `                // ignore libs or Components that start with SAPUI5 delivered namespaces` && |\n|  &&
             `                if (!ui5Libs.some(function (substring) { return compName === substring || compName.s` && |\n|  &&
             `tartsWith(substring + "."); })) {` && |\n|  &&
             `                    if (libOrCompKeysStringTmp.length > 0) {` && |\n|  &&
             `                        libOrCompKeysStringTmp = libOrCompKeysStringTmp + "," + compName;` && |\n|  &&
             `                    } else {` && |\n|  &&
             `                        libOrCompKeysStringTmp = compName;` && |\n|  &&
             `                    }` && |\n|  &&
             `                }` && |\n|  &&
             `            });` && |\n|  &&
             `            return libOrCompKeysStringTmp;` && |\n|  &&
             `        }` && |\n|  &&
             `        return new Promise(function (resolve, reject) {` && |\n|  &&
             `            $.ajax(url)` && |\n|  &&
             `                .done(function (manifest) {` && |\n|  &&
             `                    if (manifest) {` && |\n|  &&
             `                        if (` && |\n|  &&
             `                            manifest["sap.ui5"] &&` && |\n|  &&
             `                            manifest["sap.ui5"].dependencies` && |\n|  &&
             `                        ) {` && |\n|  &&
             `                            if (manifest["sap.ui5"].dependencies.libs) {` && |\n|  &&
             `                                result = getKeys(manifest["sap.ui5"].dependencies.libs, result);` && |\n|  &&
             `                            }` && |\n|  &&
             `                            if (manifest["sap.ui5"].dependencies.components) {` && |\n|  &&
             `                                result = getKeys(manifest["sap.ui5"].dependencies.components, result` && |\n|  &&
             `);` && |\n|  &&
             `                            }` && |\n|  &&
             `                        }` && |\n|  &&
             `                        if (` && |\n|  &&
             `                            manifest["sap.ui5"] &&` && |\n|  &&
             `                            manifest["sap.ui5"].componentUsages` && |\n|  &&
             `                        ) {` && |\n|  &&
             `                            result = getComponentUsageNames(manifest["sap.ui5"].componentUsages, res` && |\n|  &&
             `ult);` && |\n|  &&
             `                        }` && |\n|  &&
             `                    }` && |\n|  &&
             `                    resolve(result);` && |\n|  &&
             `                })` && |\n|  &&
             `                .fail(function () {` && |\n|  &&
             `                    reject(new Error("Could not fetch manifest at '" + manifestPath));` && |\n|  &&
             `                });` && |\n|  &&
             `        });` && |\n|  &&
             `    };` && |\n|  &&
             `    function registerModules(dataFromAppIndex) {` && |\n|  &&
             `        Object.keys(dataFromAppIndex).forEach(function (moduleDefinitionKey) {` && |\n|  &&
             `            var moduleDefinition = dataFromAppIndex[moduleDefinitionKey];` && |\n|  &&
             `            if (moduleDefinition && moduleDefinition.dependencies) {` && |\n|  &&
             `                moduleDefinition.dependencies.forEach(function (dependency) {` && |\n|  &&
             `                    if (dependency.url && dependency.url.length > 0 && dependency.type === "UI5LIB")` && |\n|  &&
             ` {` && |\n|  &&
             `                        sap.ui.require(["sap/base/Log"], function (Log) {` && |\n|  &&
             `                            Log.info("Registering Library " +` && |\n|  &&
             `                                dependency.componentId +` && |\n|  &&
             `                                " from server " +` && |\n|  &&
             `                                dependency.url);` && |\n|  &&
             `                        });` && |\n|  &&
             `                        var compId = dependency.componentId.replace(/\./g, "/");` && |\n|  &&
             `                        var config = {` && |\n|  &&
             `                            paths: {` && |\n|  &&
             `                            }` && |\n|  &&
             `                        };` && |\n|  &&
             `                        config.paths[compId] = dependency.url;` && |\n|  &&
             `                        sap.ui.loader.config(config);` && |\n|  &&
             `                    }` && |\n|  &&
             `                });` && |\n|  &&
             `            }` && |\n|  &&
             `        });` && |\n|  &&
             `    }` && |\n|  &&
             `    /**` && |\n|  &&
             `     * Registers the module paths for dependencies of the given component.` && |\n|  &&
             `     * @param {string} manifestPath The the path to the app manifest path` && |\n|  &&
             `     * for which the dependencies should be registered.` && |\n|  &&
             `     * @returns {Promise} A promise which is resolved when the ajax request for` && |\n|  &&
             `     * the app-index was successful and the module paths were registered.` && |\n|  &&
             `     */` && |\n|  &&
             `    sap.registerComponentDependencyPaths = function (manifestPath) {` && |\n|  &&
             `` && |\n|  &&
             `        return fioriToolsGetManifestLibs(manifestPath).then(function (libs) {` && |\n|  &&
             `            if (libs && libs.length > 0) {` && |\n|  &&
             `                var url = "/sap/bc/ui2/app_index/ui5_app_info?id=" + libs;` && |\n|  &&
             `                var sapClient = "";` && |\n|  &&
             `` && |\n|  &&
             `                return new Promise(` && |\n|  &&
             `                    function (resolve) {` && |\n|  &&
             `                        sap.ui.require(["sap/base/util/UriParameters"], function (UriParameters) {` && |\n|  &&
             `                            sapClient = UriParameters.fromQuery(window.location.search).get("sap-cli` && |\n|  &&
             `ent");` && |\n|  &&
             `                            if (sapClient && sapClient.length === 3) {` && |\n|  &&
             `                                url = url + "&sap-client=" + sapClient;` && |\n|  &&
             `                            }` && |\n|  &&
             `                            resolve(url);` && |\n|  &&
             `                        });` && |\n|  &&
             `                    }).then(function (url2) {` && |\n|  &&
             `                        return $.ajax(url2).done(function (data) {` && |\n|  &&
             `                            if (data) {` && |\n|  &&
             `                                registerModules(data);` && |\n|  &&
             `                            }` && |\n|  &&
             `                        });` && |\n|  &&
             `                    });` && |\n|  &&
             `            } else {` && |\n|  &&
             `                return undefined;` && |\n|  &&
             `            }` && |\n|  &&
             `        });` && |\n|  &&
             `    };` && |\n|  &&
             `})(sap);` && |\n|  &&
             `` && |\n|  &&
             `function registerSAPFonts() {  ` && |\n|  &&
             `    sap.ui.require(["sap/ui/core/IconPool"], function (IconPool) {  ` && |\n|  &&
             `    //Fiori Theme font family and URI` && |\n|  &&
             `    var fioriTheme = {` && |\n|  &&
             `        fontFamily: "SAP-icons-TNT",` && |\n|  &&
             `        fontURI: sap.ui.require.toUrl("sap/tnt/themes/base/fonts/")` && |\n|  &&
             `    };` && |\n|  &&
             `    //Registering to the icon pool` && |\n|  &&
             `    IconPool.registerFont(fioriTheme);` && |\n|  &&
             `    //SAP Business Suite Theme font family and URI` && |\n|  &&
             `    var bSuiteTheme = {` && |\n|  &&
             `        fontFamily: "BusinessSuiteInAppSymbols",` && |\n|  &&
             `        fontURI: sap.ui.require.toUrl("sap/ushell/themes/base/fonts/")` && |\n|  &&
             `    };` && |\n|  &&
             `    //Registering to the icon pool` && |\n|  &&
             `    IconPool.registerFont(bSuiteTheme);` && |\n|  &&
             `    });` && |\n|  &&
             `}` && |\n|  &&
             `` && |\n|  &&
             `/*eslint-disable fiori-custom/sap-browser-api-warning, fiori-custom/sap-no-dom-access*/` && |\n|  &&
             `var currentScript = document.getElementById("locate-reuse-libs");` && |\n|  &&
             `if (!currentScript) {` && |\n|  &&
             `    currentScript = document.currentScript;` && |\n|  &&
             `}` && |\n|  &&
             `var manifestUri = currentScript.getAttribute("data-sap-ui-manifest-uri");` && |\n|  &&
             `var componentName = currentScript.getAttribute("data-sap-ui-componentName");` && |\n|  &&
             `var useMockserver = currentScript.getAttribute("data-sap-ui-use-mockserver");` && |\n|  &&
             `` && |\n|  &&
             `sap.registerComponentDependencyPaths(manifestUri)` && |\n|  &&
             `    .catch(function (error) {` && |\n|  &&
             `        sap.ui.require(["sap/base/Log"], function (Log) {` && |\n|  &&
             `            Log.error(error);` && |\n|  &&
             `        });` && |\n|  &&
             `    })` && |\n|  &&
             `    .finally(function () {` && |\n|  &&
             `` && |\n|  &&
             `        // setting the app title with internationalization ` && |\n|  &&
             `        sap.ui.getCore().attachInit(function () {` && |\n|  &&
             `            var sLocale = sap.ui.getCore().getConfiguration().getLanguage();` && |\n|  &&
             `            sap.ui.require(["sap/base/i18n/ResourceBundle"], function (ResourceBundle) {` && |\n|  &&
             `                var oResourceBundle = ResourceBundle.create({` && |\n|  &&
             `                    url: "i18n/i18n.properties",` && |\n|  &&
             `                    locale: sLocale` && |\n|  &&
             `                });` && |\n|  &&
             `                document.title = oResourceBundle.getText("appTitle");` && |\n|  &&
             `            });` && |\n|  &&
             `        });` && |\n|  &&
             `` && |\n|  &&
             `        if (componentName && componentName.length > 0) {` && |\n|  &&
             `            if (useMockserver && useMockserver === "true") {` && |\n|  &&
             `                sap.ui.getCore().attachInit(function () {` && |\n|  &&
             `                    registerSAPFonts();` && |\n|  &&
             `                    sap.ui.require([componentName.replace(/\./g, "/") + "/localService/mockserver"],` && |\n|  &&
             ` function (server) {` && |\n|  &&
             `                        // set up test service for local testing` && |\n|  &&
             `                        server.init();` && |\n|  &&
             `                        // initialize the ushell sandbox component` && |\n|  &&
             `                        sap.ushell.Container.createRenderer().placeAt("content");` && |\n|  &&
             `                    });` && |\n|  &&
             `                });` && |\n|  &&
             `            } else {` && |\n|  &&
             `                // Requiring the ComponentSupport module automatically executes the component initia` && |\n|  &&
             `lisation for all declaratively defined components` && |\n|  &&
             `                sap.ui.require(["sap/ui/core/ComponentSupport"]);` && |\n|  &&
             `` && |\n|  &&
             `                // setting the app title with the i18n text ` && |\n|  &&
             `                sap.ui.getCore().attachInit(function () {` && |\n|  &&
             `                    registerSAPFonts();` && |\n|  &&
             `                    var sLocale = sap.ui.getCore().getConfiguration().getLanguage();` && |\n|  &&
             `                    sap.ui.require(["sap/base/i18n/ResourceBundle"], function (ResourceBundle) {` && |\n|  &&
             `                        var oResourceBundle = ResourceBundle.create({` && |\n|  &&
             `                            url: "i18n/i18n.properties",` && |\n|  &&
             `                            locale: sLocale` && |\n|  &&
             `                        });` && |\n|  &&
             `                        document.title = oResourceBundle.getText("appTitle");` && |\n|  &&
             `                    });` && |\n|  &&
             `                });` && |\n|  &&
             `            }` && |\n|  &&
             `        } else {` && |\n|  &&
             `            sap.ui.getCore().attachInit(function () {` && |\n|  &&
             `                registerSAPFonts();` && |\n|  &&
             `                try {` && |\n|  &&
             `                    // initialize the ushell sandbox component in ui5 v2` && |\n|  &&
             `                    sap.ushell.Container.createRenderer(true).then(function (component) {` && |\n|  &&
             `                        component.placeAt("content");` && |\n|  &&
             `                    });` && |\n|  &&
             `                } catch {` && |\n|  &&
             `                    // support older versions of ui5 ` && |\n|  &&
             `                    sap.ushell.Container.createRenderer().placeAt("content");` && |\n|  &&
             `                }` && |\n|  &&
             `            });` && |\n|  &&
             `        }` && |\n|  &&
             `    });` && |\n|  &&
              ``.

  ENDMETHOD.

ENDCLASS.