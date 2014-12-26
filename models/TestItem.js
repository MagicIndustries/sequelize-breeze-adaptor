/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('TestItem', {
    tableName: "spa_vTestItem",
    freezeTableName: true,

    testItemID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    testItemTypeID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    organizationID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    bAnswerable: {
      type: DataTypes.INTEGER(4),
      allowNull: false,
      defaultValue: '1'
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    identifier: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    identifierLabel: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    levelID: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
    },
    answerTypeID: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
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
