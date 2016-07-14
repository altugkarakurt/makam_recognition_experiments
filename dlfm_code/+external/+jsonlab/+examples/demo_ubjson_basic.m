%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Demonstration of Basic Utilities of JSONlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rngstate = rand ('state');
randseed=hex2dec('623F9A9E');
clear data2json json2data

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a simple scalar value \n')
fprintf(1,'%%=================================================\n\n')

data2json=pi
external.jsonlab.saveubjson('',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a complex number\n')
fprintf(1,'%%=================================================\n\n')

clear i;
data2json=1+2*i
external.jsonlab.saveubjson('',data2json)
json2data=external.jsonlab.loadubjson(ans) 

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a complex matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=magic(6);
data2json=data2json(:,1:3)+data2json(:,4:6)*i
external.jsonlab.saveubjson('',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  MATLAB special constants\n')
fprintf(1,'%%=================================================\n\n')

data2json=[NaN Inf -Inf]
external.jsonlab.saveubjson('specials',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a real sparse matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=sprand(10,10,0.1)
external.jsonlab.saveubjson('sparse',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a complex sparse matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=data2json-data2json*i
external.jsonlab.saveubjson('complex_sparse',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  an all-zero sparse matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=sparse(2,3);
external.jsonlab.saveubjson('all_zero_sparse',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  an empty sparse matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=sparse([]);
external.jsonlab.saveubjson('empty_sparse',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  an empty 0-by-0 real matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=[];
external.jsonlab.saveubjson('empty_0by0_real',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  an empty 0-by-3 real matrix\n')
fprintf(1,'%%=================================================\n\n')

data2json=zeros(0,3);
external.jsonlab.saveubjson('empty_0by3_real',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a sparse real column vector\n')
fprintf(1,'%%=================================================\n\n')

data2json=sparse([0,3,0,1,4]');
external.jsonlab.saveubjson('sparse_column_vector',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a sparse complex column vector\n')
fprintf(1,'%%=================================================\n\n')

data2json=data2json-1i*data2json;
external.jsonlab.saveubjson('complex_sparse_column_vector',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a sparse real row vector\n')
fprintf(1,'%%=================================================\n\n')

data2json=sparse([0,3,0,1,4]);
external.jsonlab.saveubjson('sparse_row_vector',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a sparse complex row vector\n')
fprintf(1,'%%=================================================\n\n')

data2json=data2json-1i*data2json;
external.jsonlab.saveubjson('complex_sparse_row_vector',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a structure\n')
fprintf(1,'%%=================================================\n\n')

data2json=struct('name','Think Different','year',1997,'magic',magic(3),...
                 'misfits',[Inf,NaN],'embedded',struct('left',true,'right',false))
external.jsonlab.saveubjson('astruct',data2json,struct('ParseLogical',1))
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a structure array\n')
fprintf(1,'%%=================================================\n\n')

data2json=struct('name','Nexus Prime','rank',9);
data2json(2)=struct('name','Sentinel Prime','rank',9);
data2json(3)=struct('name','Optimus Prime','rank',9);
external.jsonlab.saveubjson('Supreme Commander',data2json)
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a cell array\n')
fprintf(1,'%%=================================================\n\n')

data2json=cell(3,1);
data2json{1}=struct('buzz',1.1,'rex',1.2,'bo',1.3,'hamm',2.0,'slink',2.1,'potato',2.2,...
              'woody',3.0,'sarge',3.1,'etch',4.0,'lenny',5.0,'squeeze',6.0,'wheezy',7.0);
data2json{2}=struct('Ubuntu',['Kubuntu';'Xubuntu';'Lubuntu']);
data2json{3}=[10.04,10.10,11.04,11.10]
external.jsonlab.saveubjson('debian',data2json,struct('FloatFormat','%.2f'))
json2data=external.jsonlab.loadubjson(ans)

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  invalid field-name handling\n')
fprintf(1,'%%=================================================\n\n')

json2data=external.jsonlab.loadubjson(external.jsonlab.saveubjson('',external.jsonlab.loadjson('{"ValidName":1, "_InvalidName":2, ":Field:":3, "项目":"绝密"}')))

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a 2D cell array\n')
fprintf(1,'%%=================================================\n\n')

data2json={{1,{2,3}},{4,5},{6};{7},{8,9},{10}};
external.jsonlab.saveubjson('data2json',data2json)
json2data=external.jsonlab.loadubjson(ans)  % only external.jsonlab.savejson works for cell arrays, external.jsonlab.loadjson has issues

fprintf(1,'\n%%=================================================\n')
fprintf(1,'%%  a 2D struct array\n')
fprintf(1,'%%=================================================\n\n')

data2json=repmat(struct('idx',0,'data','structs'),[2,3])
for i=1:6
    data2json(i).idx=i;
end
external.jsonlab.saveubjson('data2json',data2json)
json2data=external.jsonlab.loadubjson(ans)

rand ('state',rngstate);
