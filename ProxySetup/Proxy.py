def NginxSetup(
    ProxyURL : str,
    WebProxyPort : int, 
    SSHProxyPort : int) -> None:

    NginxFileSet = f"""
    http {{
        upstream ssh {{
            server Hosting-SSH-Container:22;
        }}

        upstream http {{
            server Hosting-SSH-Container:80;
        }}

        client_max_body_size 50M;

        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $server_name;

        server {{
            listen {SSHProxyPort};
            server_name {ProxyURL};
            
            proxy_pass ssh;
        }}

        server {{
            listen {WebProxyPort};
            server_name {ProxyURL};

            proxy_pass http;
        }}
    }}
    """

    with open("/etc/nginx/sites-available/default", "w", encoding="utf8") as NginxSet:
        NginxSet.write(NginxFileSet)
        NginxSet.close()
    
    return None

if __name__ == "__main__":
    try:
        from dotenv import load_dotenv
        from os import environ

        load_dotenv()
        envDate = environ
        
        NginxSetup(
            envDate.get("ProxyURL"),
            envDate.get("WebProxyPort"),
            envDate.get("SSHProxyPort")
        )
        
        print("Done!")
    except:
        print("Error!")