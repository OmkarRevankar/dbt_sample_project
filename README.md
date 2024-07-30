## Demo on CodeSpaces

Here is a demo of how to run this on CodeSpaces:

[![dbt on codespaces demo](https://img.youtube.com/vi/UEVuIKmx5X0/maxresdefault.jpg)](https://youtu.be/UEVuIKmx5X0)

Setup python virtual environment as shown below:

```bash
rm -rf myenv
# set up venv and run dbt
python -m venv myenv
source myenv/bin/activate
pip install -r requirements.txt
```

# Run dbt 

Run dbt commands as shown below:

```bash
dbt clean
dbt deps
dbt snapshot
dbt run 
dbt test
dbt docs generate
dbt docs serve
```

# Create snapshots
```bash
# Remove header from ./raw_data/customers_new.csv
# and append it to ./raw_data/customers.csv
echo "" >> ./raw_data/customers.csv
tail -n +2 ./raw_data/customer_new.csv >> ./raw_data/customers.csv

# NOTE: Windows users need to do this manually or via powershell as
```

Run snapshot and create models again.

```bash
dbt snapshot 
dbt run 
```
Let's open a python REPL and check our data, as shown below:

```python
import duckdb
con = duckdb.connect("dbt.duckdb")
results = con.execute("select * from snapshots.customers_snapshot where customer_id = 82").fetchall()
for row in results:
    print(row)
exit()
```