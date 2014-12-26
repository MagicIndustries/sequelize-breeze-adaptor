/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('OrganizationLicences', {
    tableName: "spa_vOrganizationLicences",
    freezeTableName: true,

    organizationLicenceID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    organizationID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    moduleID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    total: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    used: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: 'CURRENT_TIMESTAMP'
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: '0000-00-00 00:00:00'
    },
    createdBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    updatedBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    }
  });
};
