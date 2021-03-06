/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('AnswerType', {
    tableName: "spa_AnswerType",
    freezeTableName: true,

    answerTypeID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
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
