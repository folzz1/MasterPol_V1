//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MasterPol_V1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Partners
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Partners()
        {
            this.PartnerProducts = new HashSet<PartnerProducts>();
        }
    
        public int ID { get; set; }
        public string PartnerName { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Patronimic { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public Nullable<long> INN { get; set; }
        public Nullable<int> Rate { get; set; }
        public Nullable<int> TypeID { get; set; }
        public Nullable<int> Discount { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PartnerProducts> PartnerProducts { get; set; }
        public virtual PartnerTypes PartnerTypes { get; set; }
    }
}
