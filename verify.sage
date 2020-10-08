import sys

# parse script arguments
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
load(lib_path + 'verify_impl.sage')

# load parameters
load('params' + params_id + '.sage')
print ('parameters n=%d, u=%d, w=%d, tau=%.8f, Xi=%d' % (n, u, w, tau, Xi))

data_path = './data/' + params_id + '/'
key_suffix = params_id + '_' + key_id
pk = load(data_path + 'pk' + key_suffix)

sign_filename = data_path +  'sign' + key_suffix + '_' + msg

signatures = load(sign_filename)
if verify(pk, signatures, w, msg):
    print ('verification succeeds for message "%s"' %(msg))
else:
    print ('verification fails for message "%s"' %(msg))
