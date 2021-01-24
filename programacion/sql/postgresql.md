# PostgreSQL

PostgreSQL is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

There is a wealth of information to be found describing how to [install](https://www.postgresql.org/download/) and [use](https://www.postgresql.org/docs/) PostgreSQL through the [official documentation](https://www.postgresql.org/docs/). The PostgreSQL community provides many helpful places to become familiar with the technology, discover how it works, and find career opportunities. Reach out to the community [here](https://www.postgresql.org/community/).

###### Reference:
* https://www.postgresql.org/

## Data Types

| Type | Name | Storage Size | Description | Range |
| ---- | ---- | ------------ | ----------- | ----- |
| Boolean | `boolean`<br>`bool` | 1 byte | state of true or false | True: true, yes, on, 1<br>False: false, no, off, 0 |
| Numeric | `smallint`<br>`int2` | 2 bytes | small-range integer | From: -32768<br>To: +32767 |
| Numeric | `integer`<br>`int` or `int4` | 4 bytes | typical choice for integer | From: -2147483648<br>To: +2147483647 |
| Numeric | `bigint`<br>`int8` | 8 bytes | large-range integer | From: -9223372036854775808<br>To: +9223372036854775807 |
| Numeric | `numeric[(p, s)]`<br>`decimal[(p, s)]` | variable | user-specified precision, exact | up to 131072 digits before<br>the decimal point;<br>up to 16383 digits after<br>the decimal point |
| Numeric | `real`<br>`float4` | 4 bytes | variable-precision, inexact | 6 decimal digits precision |
| Numeric | `double precision`<br>`float8` | 8 bytes | variable-precision, inexact | 15 decimal digits precision |
| Numeric | `smallserial`<br>`serial2` | 2 bytes | small autoincrementing integer | From: 1<br>To: 32767 |
| Numeric | `serial`<br>`serial4` | 4 bytes | autoincrementing integer | From: 1<br>To: 2147483647 |
| Numeric | `bigserial`<br>`serial8` | 8 bytes | large autoincrementing integer | From: 1<br>To: 9223372036854775807 |
| Monetary | `money` | 8 bytes | currency amount | From: -92233720368547758.08<br>To: +92233720368547758.07 |
| Character | `character varying[(n)]`<br>`varchar[(n)]` |  | variable-length with limit | If n is null then n = max |
| Character | `character[(n)]`<br>`char[(n)]` |  | fixed-length, blank padded | If n is null then n = 1 |
| Character | `text` |  | variable unlimited length |  |
| Binary | `bytea` | 1 or 4 bytes<br>plus the actual<br>binary string | variable-length binary string |  |
| Date/Time | `timestamp[(p)] [without time zone]` | 8 bytes | both date and time (no time zone) | Low Value: 4713 BC<br>High Value: 294276 AD<br>Resolution: 1 microsecond |
| Date/Time | `timestamp[(p)] with time zone`<br>`timetz` | 8 bytes | both date and time, with time zone | Low Value: 4713 BC<br>High Value: 294276 AD<br>Resolution: 1 microsecond |
| Date/Time | `date` | 4 bytes | date (no time of day) | Low Value: 4713 BC<br>High Value: 5874897 AD<br>Resolution: 1 day |
| Date/Time | `time[(p)] [without time zone]` | 8 bytes | time of day (no date) | Low Value: 0<br>High Value: 1<br>Resolution: 1 microsecond |
| Date/Time | `Time [(p)] with time zone`<br>`timestamptz` | 12 bytes | time of day (no date), with time zone | Low Value: 00:00:00+1559<br>High Value: 24:00:00-1559<br>Resolution: 1 microsecond |
| Date/Time | `interval [fields] [(p)]` | 16 bytes | time interval | Low Value: -178000000 years<br>High Value: 178000000 years<br>Resolution: 1 microsecond |

Another Types
* [Enumerated Types](https://www.postgresql.org/docs/13/datatype-enum.html)
* [Geometric Types](https://www.postgresql.org/docs/13/datatype-geometric.html)
* [Network Address Types](https://www.postgresql.org/docs/13/datatype-net-types.html)
* [Bit String Types](https://www.postgresql.org/docs/13/datatype-bit.html)
* [Text Search Types](https://www.postgresql.org/docs/13/datatype-textsearch.html)
* [UUID Type (Universally Unique Identifiers)](https://www.postgresql.org/docs/13/datatype-uuid.html)
* [XML Type (eXtensible Markup Language)](https://www.postgresql.org/docs/13/datatype-xml.html)
* [JSON Types (JavaScript Object Notation)](https://www.postgresql.org/docs/13/datatype-json.html)
* [Arrays](https://www.postgresql.org/docs/13/arrays.html)
* [Composite Types](https://www.postgresql.org/docs/13/rowtypes.html)
* [Range Types](https://www.postgresql.org/docs/13/rangetypes.html)
* [Domain Types](https://www.postgresql.org/docs/13/domains.html)
* [Object Identifier Types](https://www.postgresql.org/docs/13/datatype-oid.html)
* [pg_lsn Type](https://www.postgresql.org/docs/13/datatype-pg-lsn.html)
* [Pseudo-Types](https://www.postgresql.org/docs/13/datatype-pseudo.html)

###### Reference:
* https://www.postgresql.org/docs/13/datatype.html
* https://www.postgresql.org/docs/13/datatype-numeric.html
* https://www.postgresql.org/docs/13/datatype-money.html
* https://www.postgresql.org/docs/13/datatype-character.html
* https://www.postgresql.org/docs/13/datatype-binary.html
* https://www.postgresql.org/docs/13/datatype-datetime.html
* https://www.postgresql.org/docs/13/datatype-boolean.html





