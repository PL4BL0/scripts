#!/bin/bash
# Script para sincronizar archivos específicos desde S3 a /audittransac

# Directorio base en S3
BASE="s3://backup-core-nx/batch/post/29-11-2025/batch"

# 1. usr/cobol/salto/arch
aws s3 sync $BASE/usr/cobol/salto/arch/ /audittransac/usr/cobol/salto/arch/ \
  --exclude "*" \
  --include "mabogado*" \
  --include "mautori*" \
  --include "mbase*" \
  --include "mbeneficios*" \
  --include "mca-emb-ces*" \
  --include "mca-pres*" \
  --include "mca-pres-cup*" \
  --include "mca-pres-estado*" \
  --include "mca-pres-tot*" \
  --include "mcalendario*" \
  --include "mcano*" \
  --include "mcoam*" \
  --include "mcomercio-om*" \
  --include "mconcepto*" \
  --include "mcondicional*" \
  --include "mconsumos*" \
  --include "mconta*" \
  --include "mcostos*" \
  --include "mcotizacion*" \
  --include "mcpostal*" \
  --include "mda-facturacion*" \
  --include "mdgiid*" \
  --include "menvios*" \
  --include "mgarante*" \
  --include "mlabora*" \
  --include "mlocal-bonos*" \
  --include "mlotes*" \
  --include "mmodelos*" \
  --include "mmodelos-aut*" \
  --include "mmodelos-pres*" \
  --include "mmotden*" \
  --include "mmotivos*" \
  --include "mmotrech*" \
  --include "mpack*" \
  --include "mpack-producto*" \
  --include "mparametros*" \
  --include "mparmotivo*" \
  --include "mpermianu*" \
  --include "mpermiso*" \
  --include "mproceso*" \
  --include "mprogramas*" \
  --include "mpromociones*" \
  --include "mrecap*" \
  --include "mrechaph*" \
  --include "mrechazos*" \
  --include "mreparte*" \
  --include "mresuindi*" \
  --include "msaldoca*" \
  --include "msaldoca-det*" \
  --include "msucca*" \
  --include "mtarje*" \
  --include "mvigencia-cta*" \
  --include "mvisa-travel*" \
  --include "vpersonas*" \
  --include "msaldos-titulares*" \
  --include "msaldos-adicionales*" \
  --include "mda-om*" \
  --include "mda-disponibles*" \
  --include "ultimo-procesado*" \
  --include "mtransacciones*" \
  --include "mfechas-creditcard*"

# 2. tn/histo
aws s3 sync $BASE/tn/histo/ /audittransac/tn/histo/ --exclude "*" --include "mhiscup*" --dryrun

# 3. tn/cuentas
aws s3 sync $BASE/tn/cuentas/ /audittransac/tn/cuentas/ --exclude "*" --include "mctacli*" --dryrun

# 4. tn/bol
aws s3 sync $BASE/tn/bol/ /audittransac/tn/bol/ --exclude "*" --include "mbolestnue*" --dryrun

# 5. disk2/cierre
aws s3 sync $BASE/disk2/cierre/ /audittransac/disk2/cierre/ --exclude "*" --include "mconta*" --include "mpermiso*" --dryrun

# 6. disk4/histo1..5
for i in {1..5}; do
  aws s3 sync $BASE/disk4/histo$i/ /audittransac/disk4/histo$i --exclude "*" --include "mhiscup*" --dryrun
done