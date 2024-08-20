import subprocess

# call bash pipline to store result
try:
    result = subprocess.run(["ls", "-la"], check=True, text=True, capture_output=True)
    print(f"Command successfully executed:\n{result.stdout}")
except subprocess.CalledProcessError as e:
    print(f"Command failed with error:\n{e.stderr}")

print(result.stdout)
