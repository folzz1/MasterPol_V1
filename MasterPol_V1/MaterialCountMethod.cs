using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MasterPol_V1
{
    internal class MaterialCountMethod
    {
        static Entities db = Entities.GetContext();

        public static double? AmountMaterialForProduct(int productTypeID, int materialTypeID, int productquantity, double productParameter1, double productParameter2)
        {
            double? amount;

            if (db.Products.Select(x => x.ID).Any(num => num != productTypeID)
                || db.MaterialTypes.Select(x => x.ID).Any(num => num != materialTypeID))
            {
                MessageBox.Show("Такого ID не существует!");
                return -1;
            }

            double? productCoefficient = db.ProductTypes.Where(x => x.ID == productTypeID).Select(x => x.Coefficient).FirstOrDefault();

            double? percentageDefectiveMaterial = db.MaterialTypes.Where(x => x.ID == materialTypeID).Select(x => x.PercentageDefectiveMaterial).FirstOrDefault();

            double? MaterialPerProduct = productParameter1 * productParameter2 * productCoefficient * (1 + percentageDefectiveMaterial / 100);

            amount = MaterialPerProduct * productquantity;

            if (amount == null)
            {
                return -1;
            }

            return amount;
        }
    }
}
