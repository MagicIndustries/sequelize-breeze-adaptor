/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ModulePrice', {
    tableName: "spa_ModulePrice",
    freezeTableName: true,

    modulePriceID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    minQty: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    maxQty: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    price: {
      type: 'DOUBLE',
      allowNull: false,
    },
    moduleID: {
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
