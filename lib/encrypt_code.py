#!/usr/bin/env python
# -*- coding:utf8 -*-
"""加密模块"""

import os
import base64
from Crypto import Random
from Crypto.Hash import SHA
from Crypto.Cipher import PKCS1_v1_5 as Cipher_pkcs1_v1_5
from Crypto.Signature import PKCS1_v1_5 as Signature_pkcs1_v1_5
from Crypto.PublicKey import RSA
from lib.decorator import single_ton
from const import SECRET_KEY
rsa_path = '/opt/softdog_rsa'


@single_ton
class Encrypt(object):
    """加密处理"""

    def __init__(self):
        self.rsa_key = None
        with open(os.path.join(ras_path, 'rsa_pub')) as fp:
            self.my_pub = fp.readline()
        with open(os.path.join(ras_path, 'rsa_pri')) as fp:
            self.my_pri = fp.readline()

    @property
    def encrypt_rsa_key(self):
        return self.rsa_key

    @encrypt_rsa_key.setter
    def encrypt_rsa_key(self, pub_key):
        self.rsa_key = RSA.importKey(pub_key)

    def encrypt_msg(self, msg):
        cipher = Cipher_pkcs1_v1_5.new(self.rsa_key)
        cipher_text = base64.b64encode(cipher.encrypt(msg))
        return cipher_text

    def verify_msg(self, msg, sign):
        verifier = Signature_pkcs1_v1_5.new(rsakey)
        digest = SHA.new()
        digest.update(msg)
        is_verify = verifier.verify(digest, base64.b64decode(sign))
        return is_verify

    def decrypt_msg(self, msg):
        rsakey = RSA.importKey(self.my_pri)
        cipher = Cipher_pkcs1_v1_5.new(rsakey)
        text = cipher.decrypt(base64.b64decode(msg), SECRET_KEY)
        return text

