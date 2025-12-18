exec bronze.load_bronze


create or alter  procedure bronze.load_bronze as
 begin 
	declare @starttime datetime,@endtime datetime;
	begin try
		print '====================';
		print 'Load Bronze Layer';
		print '====================';

		print '---------------------------';
		print 'Load CRM Tables';
		print '---------------------------';

		print '>> Truncating tables and then inserting the tables';
		truncate table bronze.crm_cust_info;

		bulk insert bronze.crm_cust_info
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm/cust_info.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
 

		truncate table bronze.crm_prd_info;

		bulk insert bronze.crm_prd_info
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm/prd_info.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);


		truncate table bronze.crm_sales_details;
		bulk insert bronze.crm_sales_details
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm/sales_details.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		print '---------------------';
		print 'Loading ERP Tables';
		print '---------------------';
		truncate table bronze.erp_cust_az12;
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp/cust_az12.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);

		truncate table bronze.erp_loc_a101;
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp/loc_a101.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);

		truncate table bronze.erp_px_cat_g1v2;
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\potti\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp/px_cat_g1v2.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
	end try
	begin catch
		print '============================================'
		print 'Error occured during loading Bronze layer'
		print '============================================='
	end catch
end 
