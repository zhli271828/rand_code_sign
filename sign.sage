import sys

# security level parameter
params_id = sys.argv[1]

key_id = '0'
if len(sys.argv) > 2:
    key_id = sys.argv[2]

msg = 'msg'
if len(sys.argv) > 3:
    msg = sys.argv[3]

# load libraries
lib_path = './lib/'
load(lib_path + 'common.sage')
load(lib_path + 'sign_impl.sage')

# load parameters
load('params' + params_id + '.sage')
print ('parameters n=%d, u=%d, w=%d, tau=%.8f, Xi=%d' % (n, u, w, tau, Xi))

data_path = './data/' + params_id + '/'
key_suffix = params_id + '_' + key_id
rate_dict, M = load(data_path + 'precomp_data' + params_id)

# load pk and sk
sk = load(data_path + 'sk' + key_suffix)
pk = load(data_path + 'pk' + key_suffix)

sign_filename = data_path +  'sign' + key_suffix + '_' + msg

signature = sign(n, tau, w, rate_dict, M, pk, sk, msg)

save(signature, sign_filename)
print ('signature for "%s" saved in file %s.sobj' % (msg, sign_filename))
