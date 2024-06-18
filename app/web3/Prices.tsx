import {PriceServiceConnection} from "@pythnetwork/price-service-client";

const connection = new PriceServiceConnection("https://hermes.pyth.network");

const priceETH = async () => {
    const priceIds = ['0xff61491a931112ddf1bd8147cd1b641375f79f5825126d665480874634fd0ace'];
    const currentPrice : any = await connection.getLatestPriceFeeds(priceIds);
    return (currentPrice[0]["price"]["price"] / 10**8);
}

const priceCANTO = async () => {
    const priceIds = ['0x972776d57490d31c32279c16054e5c01160bd9a2e6af8b58780c82052b053549'];
    const currentPrice : any = await connection.getLatestPriceFeeds(priceIds);
    return (currentPrice[0]["price"]["price"] / 10**8);
}

export const priceMulti = async (token : string) => {
    if(token == "ethereum") {
        return await priceETH();
    } else if(token == "wcanto") {
        return await priceCANTO();
    } else {
        return 0;
    }
}