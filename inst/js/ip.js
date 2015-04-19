/* Function to get user IP address */
function callip() {
    if (window.XMLHttpRequest) xmlhttp = new XMLHttpRequest();
    else xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

    xmlhttp.open("GET", "http://api.hostip.info/get_html.php", false);
    xmlhttp.send();

    hostipInfo = xmlhttp.responseText.split("\n");

    for (i=0; hostipInfo.length >= i; i++) {
        ipAddress = hostipInfo[i].split(":");
        if ( ipAddress[0] == "IP" ) return ipAddress[1];
    }

    return false;
}

function getip(){
  var ipVal = callip();
  var ips = $.find(".ip")
  for (var i=0; i<ips.length; i++) {
    Shiny.onInputChange(ips[i].attributes.id.value, ipVal);
  }
}

