//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAPI.DataProvider.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class SYS_Role
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SYS_Role()
        {
            this.SYS_Account = new HashSet<SYS_Account>();
            this.SYS_Capability_Role = new HashSet<SYS_Capability_Role>();
            this.SYS_Layer_Role = new HashSet<SYS_Layer_Role>();
        }
    
        public string ID { get; set; }
        public string Name { get; set; }
        public string GroupRole { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SYS_Account> SYS_Account { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SYS_Capability_Role> SYS_Capability_Role { get; set; }
        public virtual SYS_GroupRole SYS_GroupRole { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SYS_Layer_Role> SYS_Layer_Role { get; set; }
    }
}