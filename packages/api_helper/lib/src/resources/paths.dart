const getShoppingCartPath = '/api/checkout/pub/orderForm/';
const startLoginPath = "/api/vtexid/pub/authentication/startlogin";
const sendAccessCodePath = "/api/vtexid/pub/authentication/accesskey/send";
const validateAccessCodePath =
    "/api/vtexid/pub/authentication/accesskey/validate";
const callbackUrlPath = "/api/vtexid/oauth/finish?popup=false";
const baseUrlSelector = "https://ektguatemala.vtexcommercestable.com.br";
const baseUrlSearch = "https://ektguatemala.myvtex.com";

const getStoreByPostalCode =
    "/api/checkout/pub/regions/?country=MEX&sc=1&postalcode=";
const getAllStores = "/api/dataentities/NT/search?_fields=_all";
const getShippingData =
    "/api/checkout/pub/orderForm/154347eb58894e178cc51df819ab1c0d/attachments/shippingData";
const storesCoordinates =
    "/api/checkout/pub/regions/?country=MEX&sc=1&geoCoordinates=";
const getExistingOrderFormPath =
    "/graphql/v1?workspace=master&domain=store&locale=es-MX";
const provider = 'vtex.cross-device-cart';

const resultForQueryplpUrl =
    "/api/io/_v/api/intelligent-search/product_search/region-id/U1cjaGVicWFteDAwMjk1MQ==?query=";
const endResultForQuryUrl =
    "&simulationBehavior=default&count=24&page=1&hideUnavailableItems=false";
const productsInQueryAutocomplete =
    "/api/io/_v/api/intelligent-search/product_search?simulationBehavior=default&count=24&page=1&hideUnavailableItems=false&query=";
const secondApiQuerySearch = "/api/catalog_system/pub/products/search/";
const createNewOrderFormPath = '/api/checkout/pub/orderForm/';
const updateItemsPath = '/items/update';
const getNewCartApi = '/api/checkout/pub/orderForm?forceNewCart=true';
