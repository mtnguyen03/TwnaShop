﻿using BusinessObject;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcess
{
    public class AccountDAO
    {
        private static AccountDAO instance;
        public static AccountDAO Instance
        {

            get
            {
                if (instance == null)
                {
                    instance = new AccountDAO();
                }
                return instance;
            }
        }

        public async Task<IEnumerable<Account>> GetAccounts()
        {
            var _context = new ShopDbContext();
            var list = await _context.Accounts.ToListAsync();

            return list;
        }

        public async Task<int> GetTotalAccountsAsync()
        {
            using (var _context = new ShopDbContext())
            {
                var totalAccounts = await _context.Accounts.CountAsync();
                return totalAccounts;
            }
        }

        public async Task<Account> GetAccountById(int? id)
        {
            var _context = new ShopDbContext();
            var Account = await _context.Accounts.SingleOrDefaultAsync(s => s.AccountID == id);
            return Account;
        }

        public async Task<Account> GetAccountByEmail(string email)
        {
            var _context = new ShopDbContext();
            var Account = await _context.Accounts.SingleOrDefaultAsync(s => s.Email == email);

            if (Account != null)
            {
                return Account;
            }
            else
            {
                Console.WriteLine($"User with email = {email} can't be found");
                return null;
            }
        }


        public async Task Add(Account pro)
        {
            var _db = new ShopDbContext();
            _db.Accounts.Add(pro);
            await _db.SaveChangesAsync();
        }

        public async Task Update(Account pro)
        {
            var _db = new ShopDbContext();
            var o = await GetAccountById(pro.AccountID);
            if (o != null)
            {
                _db.Accounts.Update(pro);
                await _db.SaveChangesAsync();
            }

        }

        public async Task Delete(Account pro)
        {
            var _db = new ShopDbContext();
            var o = await GetAccountById(pro.AccountID);
            if (o != null)
            {
                _db.Accounts.Remove(pro);
                await _db.SaveChangesAsync();
            }

        }

        public async Task ResetPassword(string email, string newPassword)
        {
            var _context = new ShopDbContext();
            var account = await GetAccountByEmail(email);
            if (account != null)
            {
                account.Password = HashPassword(newPassword); // Assuming you hash the password
                _context.Accounts.Update(account);
                await _context.SaveChangesAsync();
            }
            else
            {
                throw new ArgumentException("User with the specified email does not exist");
            }
        }

        private string HashPassword(string password)
        {
            using (var md5 = System.Security.Cryptography.MD5.Create())
            {
                var hashedBytes = md5.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToUpper();
            }
        }




    }


}
