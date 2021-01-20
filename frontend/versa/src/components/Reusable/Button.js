import styled, { css } from "styled-components";
import colors from "./Colors";

// The button styling is the TERTIARY button style
// To make it look like PRIMARY or SECONDARY style, add the primary or secondary as props eg:
//<Button primary>Text<Icon right/></Button>

const Button = styled.button`
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    color: ${colors.primary};
    border: none;
    background-color: ${colors.secondary};
    border-bottom: 3px solid ${colors.secondary};
    padding: 10px 20px;
    font-weight: 700;
    letter-spacing: 5%;
    transition: 0.3s ease;
    cursor: pointer;
    max-width:fit-content;

    svg {
        width: 28px;
        height: 28px;
        margin-left: 16px;
        
        path{
            transition: 0.3s ease;
            fill: ${colors.primary};
        }
        
        }
    

    &:hover {
        color: ${colors.primaryHover};
        svg{
            path{
                fill: ${colors.primaryHover};
            }
        }
    }

    &:focus{
        outline: none;
        color: ${colors.primaryHover};
        svg{
            path{
                fill: ${colors.primaryHover};
            }
        }
    }

    ${(props) =>
        props.secondary &&
        css`
            background: ${colors.secondary};
            border: 6px solid ${colors.primary};
            color: ${colors.primary};
            border-radius: 50px;
            &:hover {
            color: ${colors.primaryHover};
            border: 6px solid ${colors.primaryHover};
            svg{
                path{
                    fill: ${colors.primaryHover};
                }
            }
            &:focus{
                outline: none;
                color: ${colors.primaryHover};
            border: 6px solid ${colors.primaryHover};
            svg{
                path{
                    fill: ${colors.secondaryOther};
                }
            }
        `}
    ${(props) =>
        props.primary &&
        css`
            background: ${colors.primary};
            border: 6px solid ${colors.primary};
            border-radius: 50px;
            color:${colors.secondary};
            svg {
                path {
                    fill: ${colors.secondary};
                }
            }
            &:hover {
                background-color: ${colors.primaryHover};
                border: 6px solid ${colors.primaryHover};
                color: ${colors.secondary};
                svg {
                    path {
                        fill: ${colors.secondary};
                    }
                }
            }

            &:focus {
                outline: none;
                background-color: ${colors.primaryHover};
                color: ${colors.secondary};
                svg {
                    path {
                        fill: ${colors.secondary};
                    }
                }
            }
        `}
`;

export default Button;
