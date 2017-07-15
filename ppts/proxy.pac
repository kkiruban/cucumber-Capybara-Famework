function FindProxyForURL(url, host)
{
// variable strings to return
//inet_proxy="PROXY  31.222.152.188:3128"
//inet_proxy="PROXY  10.48.133.184:6588"
//inet_proxy="PROXY  mumbaiproxy.in.capgemini.com:8080"
//inet_proxy="PROXY  10.48.132.201:8080"
//inet_proxy="PROXY  10.23.12.110:8080"
inet_proxy="DIRECT"


//attenda_proxy="PROXY  10.65.77.212:80"
attenda_proxy="PROXY  10.74.242.10:80"
//attenda_proxy="PROXY  10.74.242.2:3128"


if (shExpMatch(host, "*.internalrmg.com"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*.trackedtest.co.uk"))
      {
	return attenda_proxy;

      }


if (shExpMatch(host, "wwwddr.*"))
      {
	return attenda_proxy;

      }

if ( shExpMatch(host, "wwwqa.*") ||  shExpMatch(host, "wwwqt.*") )
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*sit3*.*"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*qa*.*"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*qt*.*"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*b2bqa*.*"))
      {
	return attenda_proxy;

      }


if (shExpMatch(host, "*uat*.*"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*preprod*.*"))
      {
	return attenda_proxy;

      }

//if (shExpMatch(host, "idp.royalmailgroup.com"))
//      {
//	return attenda_proxy;

//      }

if (shExpMatch(host, "wwwuat.*"))
      {
	return attenda_proxy;

      }


if (shExpMatch(host, "*-rmg.com"))
      {
	return attenda_proxy;

      }

if (shExpMatch(host, "*lst*.co*"))
      {
	return attenda_proxy;

      }
 
if (isInNet(host, "10.65.0.0",  "255.255.0.0"))
      {
         return attenda_proxy;
      }
if (isInNet(host, "10.66.0.0",  "255.255.0.0"))
      {
         return attenda_proxy;
      }


if (isInNet(host, "10.45.0.0",  "255.255.0.0"))
      {
         return attenda_proxy;
      }

if (isInNet(host, "10.23.0.0",  "255.255.0.0"))
      {
         return "DIRECT";
      }

if (shExpMatch(host, "*.acentres.capgemini.co.uk"))
      {
         return "DIRECT";

      }



return inet_proxy;

}

