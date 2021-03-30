# Usage

The script contained here will launch the webdollar miner with one of the of the configured wallets that you must add
to the script (absolute paths on the file system work best).
Optionally, this can deal with locked wallets if you also provide the absolute file path of the password text files and set the `IS_LOCKED` variable in the script to `true`. This script can deal with mixed wallets of locked and unlocked. For the unlocked wallets, simply set the file path to a text file that is empty.

### Setup:

##### Preparing the script

* Copy this script to your computer, ensure it is executable -> `chmod +x alternate-mining-address.sh`
* Update `WALLET_FILES` with the paths to your WEBD wallets (json files) - space separated
* IF your wallets are locked, set `IS_LOCKED` to true and update `PASSWORD_FILES` with the paths to your password.txt files.
* Index should match WALLET_FILES, so the first password should unlock the first wallet, etc.
* In start_miner function, set the `MINING_POOL_URL` to the pool you want to mine in

##### Configuring the cron job

Linux systems allow for a cron file, that can be executed on a cadence.  The idea here is that we will execute this script once per day.

You will need to pick a cron expression as to when you want this script to run.
I suggest https://crontab.guru/

To run this once-per-day at 1am, the cron expression would be `0 1 * * *`.

We will edit the crontab of your Linux based system:

`crontab -e`

The default behavior of a cron job is to email the user who configured the cron job. You can disable this by adding `>/dev/null 2>&1` to the end of the command.

An example to run this script once per day, if it were located in `/usr/local/scripts` would be this:

```bash
0 1 * * * cd /usr/local/scripts && bash ./alternate-mining-address.sh
```

You can see examples of this [here](https://superuser.com/questions/81262/how-to-execute-shell-script-via-crontab/81266)

You can view your scheduled crons via `crontab -l`

Be sure to update the script with your values, or else this won't do what you want it to do.

At any time, you can check the logs of your miner via `docker logs -f webdollar-miner`.
