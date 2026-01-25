# Monero Mining Project

🚀 **Explore the world of cryptocurrency mining with this engaging project.**
This project sets up a Raspberry Pi (preferably Pi 4 or Pi 5, though Pi 3B is supported) to mine Monero (XMR) using the `xmrig` miner.

## 📂 Project Structure

- `config.json`: **[Critical]** Centralized configuration for XMRig. Optimized for MoneroOcean.
- `start.sh`: Helper script to launch the miner with the correct config.
- `enable_hugepages.sh`: **[New]** Script to optimize system memory performance.
- `REVIEW.md`: Detailed analysis of the performance and security of this setup.
- `Monero_Mining_Runtime.txt`: Original runtime logs.

## 💻 Deployment Instructions

Since your Pi is a remote device (`cryptopi.local`), you need to transfer these files to it.

1.  **Transfer Files**:
    from your local machine (where this repo is), run:
    ```bash
    scp config.json start.sh enable_hugepages.sh prana@cryptopi.local:~/xmrig/build/
    ```
    *(Adjust path `~/xmrig/build/` to where your xmrig executable is located).*

2.  **Connect to Pi**:
    ```bash
    ssh prana@cryptopi.local
    cd ~/xmrig/build/
    ```

3.  **Optimize (One-time setup)**:
    Run the optimizer script to enable Huge Pages (boosts hashrate significantly).
    ```bash
    sudo ./enable_hugepages.sh
    ```
    *Follow the on-screen instructions to make it permanent.*

4.  **Start Mining**:
    ```bash
    ./start.sh
    ```

## ⚙️ Configuration Details
The `config.json` is pre-configured for **MoneroOcean**, a pool that supports **Algorithm Switching**.
-   **Why?** The Pi 3B (1GB RAM) cannot efficiently mine RandomX (the main Monero algorithm) due to memory size.
-   **How it works**: The config tells the pool "I can't handle heavy stuff, give me something lighter". The pool assigns algorithms like `rx/wow` or `ghostrider` which run fast on the Pi, and pays you in XMR.

## ⚠️ Disclaimer
Mining on a Raspberry Pi is educational. It is unlikely to be profitable due to electricity costs vs yield, but it is an excellent way to learn about blockchain, Linux, and hardware handling.
