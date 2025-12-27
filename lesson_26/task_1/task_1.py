import subprocess


input_file = "ip_list.txt"
output_file = "results.txt"

if __name__ == "__main__":
    with open(input_file, 'r') as f:
        ips = [line.strip() for line in f if line.strip()]

    results = []
    for ip in ips:
        try:
            # Windows -n, Linux -c
            param = '-n' if subprocess.os.name == 'nt' else '-c'
            # 1 packet, timeout 1 sec
            result = subprocess.run(
                ['ping', param, '1', '-W', '1', ip],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
            
            if result.returncode == 0:
                results.append(f"{ip}: Available")
            else:
                results.append(f"{ip}: Unavailabe")
        except:
            results.append(f"{ip}: Error")

    with open(output_file, 'w') as f:
        for result in results:
            f.write(result + '\n')

    print(f"Checking {len(ips)} IPs\nResults in {output_file}")
