import { Injectable } from '@angular/core';
import { Http, Response, Headers, URLSearchParams} from '@angular/http';
import Tokendata = require("../data/token.data");
import Token = Tokendata.Token;

@Injectable()
export class HttpService {
    server="https://localhost:44390/";
    constructor(public  http: Http) { }
    
    public  createToken(url: string, body: URLSearchParams, headers:Headers):Token{
        let res:Token = null;
        this.http.post(this.server + url, body, { headers: headers}).subscribe(response => {
            console.log(response);
            res = response.json();
        });
        return res;
    }
    /*getData(url:string) {
        return this.http.get(this.server+url)
    }*/
}
