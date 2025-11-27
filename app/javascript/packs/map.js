(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記

  const mapWrapper = document.getElementById("map")

  const latitude = parseFloat(mapWrapper.dataset.latitude)
  const longitude = parseFloat(mapWrapper.dataset.longitude)

  if (latitude != 0 && longitude != 0) {
    const map = new Map(mapWrapper, {
      center: { lat: latitude, lng: longitude },
      zoom: 15,
      mapId: "DEMO_MAP_ID", // 追記
      mapTypeControl: false
    });
    const marker = new google.maps.marker.AdvancedMarkerElement ({
      position: { lat: latitude, lng: longitude },
      map
        // 他の任意のオプションもここに追加可能
    });
  } else {
    mapWrapper.innerHTML = `
      <div class="h-100 w-100 d-flex justify-content-center align-items-center">
        <div>
          No MapData
        </div>
      </div>
    `
  }
}

initMap()